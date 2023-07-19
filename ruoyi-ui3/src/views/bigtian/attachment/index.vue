<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="来源id" prop="busiId">
        <el-input
            v-model="queryParams.busiId"
            placeholder="请输入来源id"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="url地址" prop="url">
        <el-input
            v-model="queryParams.url"
            placeholder="请输入url地址"
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
      <!--      <el-col :span="1.5">-->
      <!--        <el-button-->
      <!--            type="primary"-->
      <!--            plain-->
      <!--            icon="Plus"-->
      <!--            @click="handleAdd"-->
      <!--            v-hasPermi="['bigtian:attachment:add']"-->
      <!--        >新增</el-button>-->
      <!--      </el-col>-->
      <!--      <el-col :span="1.5">-->
      <!--        <el-button-->
      <!--            type="success"-->
      <!--            plain-->
      <!--            icon="Edit"-->
      <!--            :disabled="single"-->
      <!--            @click="handleUpdate"-->
      <!--            v-hasPermi="['bigtian:attachment:edit']"-->
      <!--        >修改</el-button>-->
      <!--      </el-col>-->
      <el-col :span="1.5">
        <el-button
            type="danger"
            plain
            icon="Delete"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['bigtian:attachment:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="Download"
            @click="handleExport"
            v-hasPermi="['bigtian:attachment:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="attachmentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="来源id" align="center" prop="busiId"/>
      <el-table-column label="url地址" align="center" prop="url"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button
              type="text"
              icon="Edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['bigtian:attachment:edit']"
          >修改
          </el-button>
          <el-button
              type="text"
              icon="Delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['bigtian:attachment:remove']"
          >删除
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

    <!-- 添加或修改附件对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="attachmentRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="来源id" prop="busiId">
          <el-input v-model="form.busiId" placeholder="请输入来源id"/>
        </el-form-item>
        <el-form-item label="url地址" prop="url">
          <el-input v-model="form.url" placeholder="请输入url地址"/>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Attachment">
import {listAttachment, getAttachment, delAttachment, addAttachment, updateAttachment} from "@/api/bigtian/attachment";

const {proxy} = getCurrentInstance();

const attachmentList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const names = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    busiId: null,
    url: null,
  },
  rules: {}
});

const {queryParams, form, rules} = toRefs(data);

/** 查询附件列表 */
function getList() {
  loading.value = true;
  listAttachment(queryParams.value).then(response => {
    attachmentList.value = response.rows;
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
    busiId: null,
    url: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null
  };
  proxy.resetForm("attachmentRef");
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
  names.value = selection.map(item => item.busiId)

  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加附件";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const id = row.id || ids.value
  getAttachment(id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改附件";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["attachmentRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateAttachment(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addAttachment(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const attIds = row.id || ids.value;
  const attNames = row.busiId || names.value;
  proxy.$modal.confirm(`是否确认删除【${attNames}】的数据项?`).then(function () {
    return delAttachment(attIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('bigtian/attachment/export', {
    ...queryParams.value
  }, `attachment_${new Date().getTime()}.xlsx`)
}

getList();
</script>
