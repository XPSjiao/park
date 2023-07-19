<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="标题" prop="title">
        <el-input
            v-model="queryParams.title"
            placeholder="请输入标题"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">

      <el-col :span="1.5">
        <el-button
            type="danger"
            plain
            icon="Delete"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['bigtian:feedback:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="Download"
            @click="handleExport"
            v-hasPermi="['bigtian:feedback:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table @row-click="rowClick" v-loading="loading" :data="feedbackList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="标题" align="center" prop="title"/>
      <el-table-column label="描述" align="center" show-tooltip-when-overflow prop="content"/>
      <el-table-column label="整改措施" align="center" show-tooltip-when-overflow prop="measure"/>
      <el-table-column label="状态" prop="state">
        <template #default="scope">
          <el-tag v-if="scope.row.state==='wait_apply'">待处理</el-tag>
          <el-tag v-if="scope.row.state==='apply_success'" class="ml-2" type="success">已处理</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="反馈日期" align="center" prop="createTime"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button
              type="primary"
              v-if="scope.row.state==='wait_apply'"
              icon="Edit"
              size="mini"
              @click.stop="handleUpdate(scope.row)"
              v-hasPermi="['bigtian:feedback:edit']"
          >处理
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
        v-show="total>0"
        :total="total"
        v-model:page="queryParams.pageNum"
        v-model:limit="queryParams.pageSize"
        @pagination="getList"
    />

    <!-- 添加或修改反馈对话框 -->
    <el-dialog :title="title" v-model="open" width="50%" append-to-body>
      <group title="基本信息">
        <el-row>
          <el-col :span="12">
            <Details title="标题" :content="form.title"/>
          </el-col>
          <el-col :span="12">
            <Details title="回访电话" :content="form.phone"/>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <Details title="反馈时间" :content="form.createTime"/>
          </el-col>
          <el-col :span="12">
            <Details title="状态">
              <template #default>
                <el-tag v-if="form.state==='wait_apply'">待处理</el-tag>
                <el-tag v-if="form.state==='apply_success'" class="ml-2" type="success">已处理</el-tag>
              </template>
            </Details>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <Details title="问题描述" :content="form.content"/>
          </el-col>
        </el-row>
        <el-row v-if="detail" >
          <el-col>
            <Details title="处理措施" :content="form.measure"/>
          </el-col>
        </el-row>
      </group>
      <el-form v-if="detail===false" ref="feedbackRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="处理措施" prop="measure">
          <el-input rows="4" type="textarea" v-model="form.measure" placeholder="请输入处理措施"/>
        </el-form-item>
      </el-form>
      <template #footer v-if="detail==false">
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Feedback">
import {listFeedback, getFeedback, delFeedback, addFeedback, updateFeedback} from "@/api/bigtian/feedback";

const {proxy} = getCurrentInstance();
const feedbackList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const names = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const detail = ref(false);

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    title: null,
    content: null,
  },
  rules: {
    measure: [
      {required: true, message: '请输入处理措施', trigger: 'blur'},
    ]
  },
});

const {queryParams, form, rules} = toRefs(data);

/** 查询反馈列表 */
function getList() {
  loading.value = true;
  listFeedback(queryParams.value).then(response => {
    feedbackList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    title: null,
    content: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null
  };
  proxy.resetForm("feedbackRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id);
  names.value = selection.map(item => item.title)

  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加反馈";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  detail.value = false
  reset();
  const id = row.id || ids.value
  getFeedback(id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "处理反馈";
  });
}

function rowClick(val) {
  reset();
  const id = val.id
  getFeedback(id).then(response => {
    form.value = response.data;
    open.value = true;
    detail.value = true;
    title.value = "反馈明细";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["feedbackRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        form.value.state = "apply_success";
        updateFeedback(form.value).then(response => {
          proxy.$modal.msgSuccess("处理成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const feedIds = row.id || ids.value;
  console.log(feedIds);
  const feedTitles = row.title || names.value;
  proxy.$modal.confirm(`是否确认删除标题为【${feedTitles}】的数据项?`).then(function () {
    return delFeedback(feedIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('bigtian/feedback/export', {
    ...queryParams.value
  }, `feedback_${new Date().getTime()}.xlsx`)
}

getList();
</script>
