<template>
  <div>
    <div style="display: flex;margin: 20px">
      <div style="text-align: left">
        <p style="font-weight: bold;width: 70px;text-align: left"> {{ title }}</p>
      </div>
      <div class="slot">
        <p style="color: grey">{{ content }}</p>
        <slot></slot>
      </div>
    </div>
  </div>
</template>

<script setup>
defineProps({
  title: {
    default: '',
    type: String,
    required: true
  },
  content: {
    default: '',
    type: String,
    required: true
  },
  type: {
    default: '',
    type: String,
    required: true,
    validator(value) {
      return ['line', ''].includes(value)
    }
  }
})
</script>

<style scoped>
.slot {
  margin-left: 20px;
}
</style>