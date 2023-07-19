<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="停车场名称" prop="name" label-width="100">
        <el-input
            v-model="queryParams.name"
            placeholder="请输入停车场名称"
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

      <div style="height: 40px">
        <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
      </div>

    </el-row>

    <el-table @row-click="rowClick" v-loading="loading" :data="parksList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"/>
      <el-table-column label="停车场名称" prop="name" :show-overflow-tooltip="true"/>
      <el-table-column label="联系人" prop="linkman" width="80"/>
      <el-table-column label="手机号" :show-overflow-tooltip="true" prop="phone" width="150"/>
      <el-table-column label="车位" prop="vehicleNum" width="80"/>
        <el-table-column label="金额" width="180" :show-overflow-tooltip="true" prop="price"/>

        <el-table-column label="收费标准" prop="textContent" width="180" :show-overflow-tooltip="true"/>
      <el-table-column label="状态" prop="state">
        <template #default="scope">
          <dict-tag :options="apply_status" :value="scope.row.state"/>
        </template>
      </el-table-column>
      <el-table-column label="审批意见" prop="remark" :show-overflow-tooltip="true"/>
      <el-table-column label="地图名称" width="180" :show-overflow-tooltip="true" prop="pointName"/>
      <el-table-column label="详细地址" width="180" :show-overflow-tooltip="true" prop="pointDetail"/>
      <el-table-column label="操作" fixed="right" width="210" class-name="small-padding fixed-width">
        <template #default="scope">

          <el-button
              type="primary"
              v-if="scope.row.state==='wait_apply'"
              icon="Edit"
              size="mini"
              @click.stop="handleUpdate(scope.row)"
              v-hasPermi="['bigtian:parks:edit']"
          >审批
          </el-button>

          <el-button
              v-if="scope.row.state==='apply_success'"
              type="warning"
              icon="Remove"
              size="mini"
              @click.stop="handleDisabled(scope.row)"
          >禁用
          </el-button>
          <el-button
              v-if="scope.row.state==='forbidden'"
              type="success"
              icon="Remove"
              size="mini"
              @click.stop="enable(scope.row)"
          >启用
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

    <!-- 添加或修改停车场对话框 -->
    <el-dialog title="停车场申请信息" v-model="open" width="60%" append-to-body>
      <group title="基本信息">
        <el-row>
          <el-col :span="8">
            <Details title="停车场名称" :content="form.name"/>
          </el-col>
          <el-col :span="8">
            <Details title="联系人" :content="form.linkman"/>
          </el-col>
            <el-col :span="8">
            <Details title="金额" :content="form.price"/>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <Details title="手机号" :content="form.phone"/>
          </el-col>
          <el-col :span="12">
            <Details title="车位" :content="form.vehicleNum"/>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <Details title="收费标准" :content="form.textContent"/>
          </el-col>
          <el-col :span="12">
            <Details title="地图名称" :content="form.pointName"/>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <Details title="详细地址" :content="form.pointDetail"/>

          </el-col>
          <el-col :span="12">
            <Details title="场内图像">
              <image-preview :src="form.atts" :width="50" :height="50"/>
              <span style="color: grey;font-weight: bold;margin: auto 20px">共计:{{
                  form.atts?.split(',').length
                }}张</span>
            </Details>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="18">
            <el-form
                ref="ruleFormRef"
                :rules="rules"
                label-width="120px"
                class="demo-ruleForm"
            >

              <el-form-item label="审批意见">
                <el-input type="textarea" rows="5" v-model="form.remark"></el-input>
              </el-form-item>
            </el-form>
          </el-col>

        </el-row>
      </group>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="success" @click="submitForm">通过</el-button>
          <el-button type="danger" @click="cancel">拒绝</el-button>
        </div>
      </template>
    </el-dialog>
    <el-drawer
        v-model="visible"
        title="收费标准"
        :direction="direction"
    >
      <div v-html="ratesContent"></div>
    </el-drawer>
  </div>
</template>

<script setup name="Parks">
import {listParks, getParks, applyPark} from "@/api/bigtian/parks";

const {proxy} = getCurrentInstance();
const {apply_status} = proxy.useDict('apply_status');
const ratesContent = ref('')
const direction = ref('rtl')
const parksList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const names = ref([]);
const single = ref(true);
const multiple = ref(true);
const disabled = ref(false);
const total = ref(0);
const title = ref("");
const visible = ref(false);

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    name: null,
    linkman: null,
    phone: null,
  },
  rules: {
    remark: [
      {required: true, message: "停车场名称不能为空", trigger: "blur"}
    ]
  }
});

const {queryParams, form, rules} = toRefs(data);

function rowClick(val) {
  visible.value = true;
  ratesContent.value = val.rates;
}

/** 查询停车场列表 */
function getList() {
  loading.value = true;
  listParks(queryParams.value).then(response => {
    parksList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    name: null,
    linkman: null,
    phone: null,
    vehicleNum: null,
    residueVehicleNum: null,
    longitude: null,
    latitude: null,
    tags: null,
    rates: null,
    state: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    pointName: null,
    pointDetail: null,
    atts: '',
    remark: null,
  };
  proxy.resetForm("parksRef");
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
  names.value = selection.map(item => item.name)

  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

//启用
function enable(row) {
  updateStatus({id: row.id, state: "apply_success"})
}

//禁用
function handleDisabled(row) {
  updateStatus({id: row.id, state: "forbidden"})
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加停车场";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  visible.value = false
  const id = row.id || ids.value
  getParks(id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改停车场";
  });
}

/** 提交按钮 */
function submitForm() {
  form.value.state = "apply_success"
  updateStatus({id: form.value.id, state: "apply_success",remark:form.value.remark})
}

// 取消按钮
function cancel() {
  visible.value = false
  if (form.value.remark === null) {
    proxy.$modal.msgError("审批意见不能为空");
    return;
  }
  updateStatus({id: form.value.id, state: "fail_apply", remark: form.value.remark})
}

/** 删除按钮操作 */
function handleDelete(row) {
  const idKeys = row.id || ids.value;
  const nameArr = row.name || this.names;
  proxy.$modal.confirm(`是否确认删除停车场名称为【${nameArr}】的数据项?`).then(function () {
    return delParks(idKeys);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('bigtian/parks/export', {
    ...queryParams.value
  }, `parks_${new Date().getTime()}.xlsx`)
}

//修改停车场状态
function updateStatus(data) {
  applyPark(data).then(response => {
    proxy.$modal.msgSuccess("操作成功");
    open.value = false;
    getList();
  }).catch(err => {
    proxy.$modal.msgError(err.message);
  });
}

getList();
</script>

<style scoped>


.dialog-footer {
  text-align: center !important;
}

.el-form-item__label {
  color: black;
}

</style>