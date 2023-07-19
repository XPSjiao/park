<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="开放者id" prop="openId">
        <el-input
            v-model="queryParams.openId"
            placeholder="请输入开放者id"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="昵称" prop="nickName">
        <el-input
            v-model="queryParams.nickName"
            placeholder="请输入昵称"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="性别" prop="gender">
        <el-select v-model="queryParams.gender" placeholder="请选择性别" clearable>
          <el-option
              v-for="dict in sys_user_sex"
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
            type="warning"
            plain
            icon="Download"
            @click="handleExport"
            v-hasPermi="['bigtian:wechatUser:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="wechatUserList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" />
      <el-table-column label="开放者id" prop="openId" :show-overflow-tooltip="true"/>
      <el-table-column label="昵称" prop="nickName"  :show-overflow-tooltip="true"/>
      <el-table-column label="性别"  prop="gender">
        <template #default="scope">
          <dict-tag :options="sys_user_sex" :value="scope.row.gender"/>
        </template>
      </el-table-column>
      <el-table-column label="头像"  :show-overflow-tooltip="true" prop="avatarUrl"  >
        <template #default="scope">
          <image-preview :src="scope.row.avatarUrl" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="首次访问时间"   :show-overflow-tooltip="true" prop="createTime">
      </el-table-column>
    </el-table>

    <pagination
        v-show="total>0"
        :total="total"
        v-model:page="queryParams.pageNum"
        v-model:limit="queryParams.pageSize"
        @pagination="getList"
    />

    <!-- 添加或修改微信用户对话框 -->
    <el-dialog :title="title" v-model="open" width="50%" append-to-body>
      <el-form ref="wechatUserRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="开放者id" prop="openId">
          <el-input v-model="form.openId" placeholder="请输入开放者id"/>
        </el-form-item>
        <el-form-item label="昵称" prop="nickName">
          <el-input v-model="form.nickName" placeholder="请输入昵称"/>
        </el-form-item>
        <el-form-item label="性别" prop="gender">
          <el-select v-model="form.gender" placeholder="请选择性别">
            <el-option
                v-for="dict in sys_user_sex"
                :key="dict.value"
                :label="dict.label"
                :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="头像">
          <image-upload v-model="form.avatarUrl"/>
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

<script setup name="WechatUser">
import {listWechatUser, getWechatUser, delWechatUser, addWechatUser, updateWechatUser} from "@/api/bigtian/wechatUser";

const {proxy} = getCurrentInstance();
const {sys_user_sex} = proxy.useDict('sys_user_sex');

const wechatUserList = ref([]);
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
    openId: null,
    nickName: null,
    gender: null,
    avatarUrl: null,
    type: null,
  },
  rules: {
    openId: [
      {required: true, message: "开放者id不能为空", trigger: "blur"}
    ],
  }
});

const {queryParams, form, rules} = toRefs(data);

/** 查询微信用户列表 */
function getList() {
  loading.value = true;
  listWechatUser(queryParams.value).then(response => {
    wechatUserList.value = response.rows;
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
    openId: null,
    nickName: null,
    gender: null,
    avatarUrl: null,
    type: null,
    createBy: null,
    updateBy: null,
    createTime: null,
    updateTime: null
  };
  proxy.resetForm("wechatUserRef");
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
  names.value = selection.map(item => item.openId)

  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加微信用户";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const id = row.id || ids.value
  getWechatUser(id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改微信用户";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["wechatUserRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateWechatUser(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addWechatUser(form.value).then(response => {
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
  const idKeys = row.id || ids.value;
  const nameArr = row.openId || this.names;
  proxy.$modal.confirm(`是否确认删除开放者id为【${nameArr}】的数据项?`).then(function () {
    return delWechatUser(idKeys);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('bigtian/wechatUser/export', {
    ...queryParams.value
  }, `wechatUser_${new Date().getTime()}.xlsx`)
}

getList();
</script>
