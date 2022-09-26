<template>
  <el-aside width="150px">
    <el-menu
      :default-active="currentRoute"
      mode="vertical"
      router>
      <el-menu-item index="/host">
        <i class="el-icon-share"></i>
        <span slot="title">节点列表</span>
      </el-menu-item>
    </el-menu>
  </el-aside>
</template>

<script>
export default {
  name: 'host-sidebar',
  data () {
    return {}
  },
  computed: {
    currentRoute () {
      return '/host'
    }
  }
}
</script>
