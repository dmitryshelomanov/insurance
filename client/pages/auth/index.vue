<template>
	<div>
		<section class="auth">
			<transition name="slide-fade">
				<div class="modal" v-show="!auth.reg">
					<form action="">
						<span @click="auth.reg = true">Нету аккаунта?</span>
						<nuxt-link :to="{name: 'index'}">На главную</nuxt-link>
						<div class="alert bg-danger text-danger" v-show="errors.login">
							Не верный логин или пароль
						</div>
						<h4>Вход в аккаунт</h4>
						<div class="form-group">
							<label for="">Логин</label>
							<i class="fa fa-user"></i>
							<input type="text" class="form-control" v-model="data.login">
						</div>
						<div class="form-group">
							<label for="">Пароль</label>
							<i class="fa fa-lock"></i>
							<input type="text" class="form-control" v-model="data.password">
						</div>
						<input type="button" value="войти" class="btn btn-primary form-control"  @click="logined">
					</form>
				</div>
			</transition>

			<transition name="slide-fade">
				<div class="modal" v-show="auth.reg">
					<form action="">
						<span @click="auth.reg = false">Есть аккаунт?</span>
						<div class="alert bg-danger text-danger" v-if="errors.register">
							<ul>
								<li v-for="item in errors.register">{{ item[0] }}</li>
							</ul>
						</div>
						<h4>Регистрация</h4>
						<div class="form-group">
							<label for="">Логин</label>
							<i class="fa fa-user"></i>
							<input type="text" class="form-control" v-model="user.login">
						</div>
						<div class="form-group">
							<label for="">Имя</label>
							<i class="fa fa-lock"></i>
							<input type="text" class="form-control" v-model="user.name">
						</div>
						<div class="form-group">
							<label for="">Пароль</label>
							<i class="fa fa-lock"></i>
							<input type="text" class="form-control" v-model="user.password">
						</div>
						<div class="form-group">
							<label for="">Повторите пароль</label>
							<i class="fa fa-lock"></i>
							<input type="text" class="form-control" v-model="user.password_confirmation">
						</div>
						<input type="button" value="войти" class="btn btn-primary form-control" @click="register">
					</form>
				</div>
			</transition>
			<div class="company text-center">
			  <img src="img/banner.png" alt=""> ROSGOSSTRAH COMPANY
			</div>
			<div class="preloader" v-show="preload"></div>
		</section>
	</div>
</template>

<style scoped>
	.slide-fade-enter-active {
		transition: all .3s ease;
	}
	.slide-fade-leave-active {
		transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);
	}
	.slide-fade-enter, .slide-fade-leave-to
		/* .slide-fade-leave-active для <2.1.8 */ {
		transform: translateX(400px);
		opacity: 0;
	}
</style>

<script>
	import { ipDomain, clientId, clientSecret, getHeader } from '~/config.js';

	export default {
		data () {
			return {
				auth: {
					reg: false,
				},
				errors: {
					login: false,
					register: false
				},
				user: {
					name: '',
					password: '',
					'password_confirmation': '',
					login: '',
				},
				data: {
					login: '',
					password: ''
				},
				preload: false
			}
		},
		methods: {
			register () {
				this.preload = true
				this.$http.post(ipDomain + 'api/register', this.user)
					.then(responce => {
						if (responce.status === 200) {
							this.auth.reg = false
							this.preload = false
						}
					}, error => {
						if (error.status === 400) {
							this.errors.register = error.data
							this.preload = false
						}
					})
			},
			logined () {
				this.preload = true
				let loginData = {
						grant_type: 'password',
						client_id: clientId,
						client_secret: clientSecret,
						username: this.data.login,
						password: this.data.password,
						scope: ''
					}
				let authUser = {}

				this.$http.post(ipDomain + 'oauth/token', loginData)
					.then(response => {
						if (response.status === 200) {

							authUser.access_token = response.data.access_token;
							authUser.refresh_token = response.data.refresh_token;
							window.localStorage.setItem('authUser', JSON.stringify(authUser));

							this.$http.get(ipDomain + 'api/user', {headers: getHeader()})
								.then(response => {

									this.preload = false

									authUser.data = response.data;
									window.localStorage.setItem('authUser', JSON.stringify(authUser));

									this.$store.commit('userStore/SET_AUTH_USER', authUser)
									this.$router.push({name: 'index'});

								});

						} 	

					}, error => {

						if (error.status === 401) {
							this.errors.login = true
							this.preload = false
						}

					});
			}
		}
	}
</script>