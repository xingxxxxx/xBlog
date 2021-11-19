<template>
  <div>
    <Header></Header>
    <div class="mBlog">
      <h2>{{blog.title}}</h2>
      <el-link icon="el-icon-edit" v-if="ownBlog">
        <router-link :to="{name: 'BlogEdit',params:{blogId: blog.id}}">编辑</router-link>
      </el-link>
      <el-link icon="el-icon-delete" v-if="ownBlog">
        <router-link :to="{name: 'BlogDelete',params:{blogId: blog.id}}">删除</router-link>
      </el-link>
      <el-divider></el-divider>
      <div v-html="blog.content"></div>
    </div>
  </div>
</template>

<script>
import Header from "@/components/Header";
import 'github-markdown-css'
export default {
  name: "BlogDetail",
  components: {Header},
  data(){
    return{
      blog: {
        id: '',
        title: '',
        content: ''
      },
      ownBlog: false
    }
  },
  created() {
    const blogId = this.$route.params.blogId
    console.log(blogId)
    const _this = this
    if(blogId){
      this.$axios.get('/blog/'+blogId).then(res =>{
        const blog = res.data.data
        _this.blog.id = blog.id
        _this.blog.title = blog.title

        var MarkdownIt = require("markdown-it")
        var md = new MarkdownIt()
        var result = md.render(blog.content)
        _this.blog.content = result
        _this.ownBlog = (blog.userId === _this.$store.getters.getUser.id)
      })
    }
  }
}
</script>

<style scoped>
.mBlog{
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  width: 100%;
  min-height: 700px;
}
</style>