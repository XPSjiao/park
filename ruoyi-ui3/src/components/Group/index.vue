<template>
  <div class="content">
    <div class="group">
      <div>{{ title }}</div>
    </div>
    <hr class="line">
      <slot/>
  </div>
</template>

<script setup>
defineProps({
      title: {
        type: String,
        default: '基本信息',
        required: true
      },
    }
)
</script>

<style scoped>
.group {
  display: flex;
  align-items: center;
  margin-bottom: 13px;
}

.group:before {
  content: '';
  height: 20px;
  width: 5px;
  border-radius: 3px;
  display: inline-block;
  background: dodgerblue;
  margin-right: 10px;
}

.line {
  border: 0.5px solid #d5d4d4;
}

.content {
  padding: 10px;
  color: black;
}
</style>