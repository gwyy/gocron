<template>
  <el-aside width="150px">
    <el-menu
      :default-active="currentRoute"
      mode="vertical"
      router>
      <el-menu-item index="/user">
        <i class="el-icon-news"></i>
        <span slot="title">用户列表</span>
      </el-menu-item>
    </el-menu>
  </el-aside>
</template>

<script>
export default {
  name: 'user-sidebar',
  data () {
    return {}
  },
  computed: {
    currentRoute () {
      return '/user'
    }
  }
}
</script>
