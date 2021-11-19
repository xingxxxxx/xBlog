<template>
  <div>
    <Header></Header>
  </div>
</template>

<script>
import 'github-markdown-css'
export default {
  name: "BlogDelete",
  created() {
    const blogId = this.$route.params.blogId
    console.log(blogId)
    const _this = this
    if (blogId) {
      this.$axios.get('/blog/delete/' + blogId,{
        headers: {
          "authentication": localStorage.getItem("token")
        }
      }).then(res =>{
        this.$alert('操作成功', '提示', {
          confirmButtonText: '确定',
          callback: action => {
            _this.$router.push('/blogs')
          }
        });
      })
    } else {
      console.log('delete fail !!');
      return false;
    }
  }
}
</script>

<style scoped>

</style>