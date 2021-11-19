<template>
  <div>
    <el-container>
      <el-header>
        <h2>X-BLOG博客平台</h2>
      </el-header>
      <el-main>
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
          <el-form-item label="用户名" prop="username">
            <el-input v-model="ruleForm.username"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password">
            <el-input type="password" v-model="ruleForm.password"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button @click="submitForm('ruleForm')">登录</el-button>
            <el-button type="primary" plain @click="register()">注册</el-button>
            <el-button @click="resetForm('ruleForm')">重置</el-button>
          </el-form-item>
        </el-form>
      </el-main>
    </el-container>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      ruleForm: {
        username: '',
        password: ''
      },
      rules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 3, max: 10, message: '长度在 3 到 10 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'change' }
        ]
      }
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          const _this = this
          this.$axios.post('/login',this.ruleForm).then(res =>{
            const jwt = res.headers['authentication']
            const userInfo = res.data.data

            _this.$store.commit("SET_TOKEN",jwt)
            _this.$store.commit("SET_USERINFO",userInfo)
            _this.$router.push("/blogs")
          })

        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    register() {
      const _this = this
      _this.$router.push("/register")
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  }
}
</script>

<style scoped>
.el-header{
  margin-top: 100px;
  margin-left: 70px;
  text-align: center;
  line-height: 60px;
}

.el-aside {
  background-color: #D3DCE6;
  color: #333;
  text-align: center;
  line-height: 200px;
}

.el-main {
  /*background-color: #E9EEF3;
  color: #333;*/
  text-align: center;
  line-height: 160px;
  margin-top: 50px;
}

body > .el-container {
  margin-bottom: 40px;
}

.el-container:nth-child(5) .el-aside,
.el-container:nth-child(6) .el-aside {
  line-height: 260px;
}

.el-container:nth-child(7) .el-aside {
  line-height: 320px;
}

.demo-ruleForm{
  max-width: 500px;
  margin:0 auto;
}
</style>