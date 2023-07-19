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
      <el-form-item label="联系人" prop="linkman">
        <el-input
            v-model="queryParams.linkman"
            placeholder="请输入联系人"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号" prop="phone">
        <el-input
            v-model="queryParams.phone"
            placeholder="请输入手机号"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="state">
        <el-select v-model="queryParams.state" placeholder="请选择状态" clearable>
          <el-option
              v-for="dict in apply_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
          />
        </el-select>
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
            v-hasPermi="['bigtian:joinUs:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="Download"
            @click="handleExport"
            v-hasPermi="['bigtian:joinUs:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table @row-click="rowClick" v-loading="loading" :data="joinUsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"/>
      <el-table-column label="标题" prop="title" :show-overflow-tooltip="true"/>
      <el-table-column label="联系人" prop="linkman" :show-overflow-tooltip="true"/>
      <el-table-column label="手机号" prop="phone" :show-overflow-tooltip="true"/>
      <el-table-column label="详细内容" prop="content" :show-overflow-tooltip="true"/>
      <el-table-column label="状态" :show-overflow-tooltip="true" prop="state">
        <template #default="scope">
          <dict-tag :options="apply_status" :value="scope.row.state"/>
        </template>
      </el-table-column>
      <el-table-column label="审核意见" prop="remark" :show-overflow-tooltip="true"/>
      <el-table-column label="操作" width="150" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button
              type="primary"
              v-if="scope.row.state==='wait_apply'"
              icon="Edit"
              size="mini"
              @click.stop="handleUpdate(scope.row)"
              v-hasPermi="['bigtian:joinUs:edit']"
          >审批
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

    <!-- 添加或修改合同共赢对话框 -->
    <el-dialog :title="title" v-model="open" width="50%" append-to-body>
      <group title="基本信息">
        <el-row>
          <el-col :span="12">
            <Details title="标题" :content="form.title"/>
          </el-col>
          <el-col :span="12">
            <Details title="联系人" :content="form.linkman"/>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <Details title="手机号" :content="form.phone"/>
          </el-col>
          <el-col :span="12">
            <Details title="状态">
              <template #default>
                <el-tag v-if="form.state==='wait_apply'">待处理</el-tag>
                <el-tag v-else-if="form.state==='apply_success'" class="ml-2" type="success">审核通过</el-tag>
                <el-tag v-else class="ml-2" type="error">审核不通过</el-tag>
              </template>
            </Details>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <Details title="详细内容" :content="form.content"/>
          </el-col>
          <el-col :span="12">
            <Details title="审核意见" :content="form.remark"/>
          </el-col>
        </el-row>
        <el-row v-if="detail">
          <el-col :span="24">
            <Details title="附件">
              <template #default>
                <el-upload
                    action="https://jsonplaceholder.typicode.com/posts/"
                    list-type="text"
                    :file-list="fileList"
                    :on-preview="preview"
                    disabled
                >
                  <el-icon>
                    <Plus/>
                  </el-icon>
                </el-upload>
              </template>
            </Details>
          </el-col>
        </el-row>
      </group>
      <el-form ref="joinUsRef" :model="form" :rules="rules" label-width="80px" v-if="detail===false">
        <el-form-item label="审核意见" prop="remark">
          <el-input rows="4" v-model="form.remark" type="textarea" placeholder="请输入内容"/>
        </el-form-item>
      </el-form>

      <template #footer v-if="detail===false">
        <div class="dialog-footer">
          <el-button type="success" @click="submitForm">通过</el-button>
          <el-button type="danger" @click="cancel">拒绝</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="JoinUs">
import {listJoinUs, getJoinUs, delJoinUs, addJoinUs, updateJoinUs} from "@/api/bigtian/joinUs";

const {proxy} = getCurrentInstance();
const {apply_status} = proxy.useDict('apply_status');
const fileList = ref([])
const joinUsList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const names = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const detail = ref(false)
const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    title: null,
    linkman: null,
    phone: null,
    content: null,
    state: null,
  },
  rules: {}
});

const {queryParams, form, rules} = toRefs(data);

/** 查询合同共赢列表 */
function getList() {
  loading.value = true;
  listJoinUs(queryParams.value).then(response => {
    joinUsList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

//下载文件
function preview(val) {
  window.location.href = val.url
}

function rowClick(val) {
  getJoinUs(val.id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "入驻审核";
    detail.value = true;
    fileList.value = []
    response.data.atts.split(',').forEach(item => {
      fileList.value.push({
        name: item.substring(item.lastIndexOf("_") + 1),
        url: item
      })
    })
  });
}

// 取消按钮
function cancel() {
  if (form.value.remark === null || form.value.remark === '') {
    proxy.$modal.msgError("处理意见不能为空");
    return;
  }
  form.value.state = "fail_apply";
  updateJoinUs(form.value).then(response => {
    proxy.$modal.msgSuccess("处理成功");
    open.value = false;
    getList();
  });

}

// 表单重置
function reset() {
  form.value = {
    id: null,
    title: null,
    linkman: null,
    phone: null,
    content: null,
    state: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null
  };
  proxy.resetForm("joinUsRef");
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
  title.value = "添加合同共赢";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const id = row.id || ids.value
  getJoinUs(id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "入驻审核";
    detail.value = false;
    response.data.atts.split(',').forEach(item => {
      fileList.value.push({
        name: item.substring(item.lastIndexOf("_") + 1),
        url: item
      })
    })

  });
}

/** 提交按钮 */
function submitForm() {
  form.value.state = "apply_success";
  updateJoinUs(form.value).then(response => {
    proxy.$modal.msgSuccess("处理成功");
    open.value = false;
    getList();
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const idKeys = row.id || ids.value;
  const nameArr = row.title || names.value;
  proxy.$modal.confirm(`是否确认删除标题为【${nameArr}】的数据项?`).then(function () {
    return delJoinUs(idKeys);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('bigtian/joinUs/export', {
    ...queryParams.value
  }, `joinUs_${new Date().getTime()}.xlsx`)
}

getList();
</script>
<style scoped>
.dialog-footer {
  text-align: center !important;
}

/deep/ .el-upload {
  display: none;
}

/deep/ .el-upload-list__item-status-label svg {
  display: none !important;
}
</style>