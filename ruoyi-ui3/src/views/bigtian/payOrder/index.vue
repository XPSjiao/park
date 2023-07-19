<template>
    <div class="app-container">
        <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
            <el-form-item label="支付用户" prop="userId">

                <el-select
                        v-model="queryParams.userId"
                        filterable
                        remote
                        reserve-keyword
                        placeholder="请输入支付用户名称"
                        :remote-method="remoteUser"
                        :loading="loading"
                >
                    <el-option
                            v-for="item in data.payUserList"
                            :key="item.nickName"
                            :label="item.nickName"
                            :value="item.id"
                    />
                </el-select>
            </el-form-item>
            <el-form-item label="停车场" prop="parkId">

                <el-select
                        v-model="queryParams.parkId"
                        filterable
                        remote
                        reserve-keyword
                        placeholder="请输入支付停车场名称"
                        :remote-method="remotePark"
                        :loading="loading"
                >
                    <el-option
                            v-for="item in data.parkList"
                            :key="item.name"
                            :label="item.name"
                            :value="item.id"
                    />
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
                <el-button icon="Refresh" @click="resetQuery">重置</el-button>
            </el-form-item>
        </el-form>

        <el-table v-loading="loading" :data="payOrderList" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="55"/>
            <el-table-column label="支付用户" prop="nickName" :show-overflow-tooltip="true"/>
            <el-table-column label="头像" :show-overflow-tooltip="true" prop="picUrl">
                <template #default="scope">
                    <image-preview :src="scope.row.picUrl" :width="50" :height="50"/>
                </template>
            </el-table-column>
            <el-table-column label="停车场" prop="parkName" :show-overflow-tooltip="true"/>
            <el-table-column label="金额" prop="price" :show-overflow-tooltip="true"/>
            <el-table-column label="状态" prop="status" :show-overflow-tooltip="true">
                <template #default="scope">
                    <el-tag class="ml-2" type="success">支付成功</el-tag>
                </template>
            </el-table-column>
            <el-table-column label="支付时间" prop="createTime" :show-overflow-tooltip="true"/>
        </el-table>

        <pagination
                v-show="total>0"
                :total="total"
                v-model:page="queryParams.pageNum"
                v-model:limit="queryParams.pageSize"
                @pagination="getList"
        />

        <!-- 添加或修改支付订单对话框 -->
        <el-dialog :title="title" v-model="open" width="50%" append-to-body>
            <el-form ref="payOrderRef" :model="form" :rules="rules" label-width="80px">
                <el-form-item label="${comment}" prop="id">
                    <el-input v-model="form.id" placeholder="请输入${comment}"/>
                </el-form-item>
                <el-form-item label="支付用户" prop="userId">
                    <el-input v-model="form.userId" placeholder="请输入支付用户"/>
                </el-form-item>
                <el-form-item label="停车场id" prop="parkId">
                    <el-input v-model="form.parkId" placeholder="请输入停车场id"/>
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

<script setup name="PayOrder">
import {listPayOrder, getPayOrder, delPayOrder, addPayOrder, updatePayOrder} from "@/api/bigtian/payOrder";
import {listWechatUser} from "@/api/bigtian/wechatUser";
import {listParks} from "@/api/bigtian/parks";

const {proxy} = getCurrentInstance();

const payOrderList = ref([]);
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
    payUserList: [],
    parkList: [],
    queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        parkId: null,
        status: null
    },
    rules: {}
});

const {queryParams, form, rules} = toRefs(data);

/** 查询支付订单列表 */
function getList() {
    loading.value = true;
    listPayOrder(queryParams.value).then(response => {
        payOrderList.value = response.rows;
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
        userId: null,
        createTime: null,
        parkId: null,
        status: 0
    };
    proxy.resetForm("payOrderRef");
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
    names.value = selection.map(item => item.userId)

    single.value = selection.length != 1;
    multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
    reset();
    open.value = true;
    title.value = "添加支付订单";
}

/** 修改按钮操作 */
function handleUpdate(row) {
    reset();
    const id = row.id || ids.value
    getPayOrder(id).then(response => {
        form.value = response.data;
        open.value = true;
        title.value = "修改支付订单";
    });
}

/** 提交按钮 */
function submitForm() {
    proxy.$refs["payOrderRef"].validate(valid => {
        if (valid) {
            if (form.value.id != null) {
                updatePayOrder(form.value).then(response => {
                    proxy.$modal.msgSuccess("修改成功");
                    open.value = false;
                    getList();
                });
            } else {
                addPayOrder(form.value).then(response => {
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
    const nameArr = row.userId || names.value;
    proxy.$modal.confirm(`是否确认删除支付用户为【${nameArr}】的数据项?`).then(function () {
        return delPayOrder(idKeys);
    }).then(() => {
        getList();
        proxy.$modal.msgSuccess("删除成功");
    }).catch(() => {
    });
}

/** 导出按钮操作 */
function handleExport() {
    proxy.download('bigtian/payOrder/export', {
        ...queryParams.value
    }, `payOrder_${new Date().getTime()}.xlsx`)
}

function remoteUser(query) {
    if (!query) {
        return
    }
    listWechatUser({nickName: query}).then(res => {
        data.payUserList = res.rows
    })
}

function remotePark(query) {
    if (!query) {
        return
    }
    listParks({name: query}).then(res => {
        data.parkList = res.rows
    })
}

getList();
</script>
