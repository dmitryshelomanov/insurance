<template>
	<transition name="bounce">
		<div class="modal-wrapper">
			<div class="modal-inner" v-if="!denied">
				<div class="close" @click="close">&times;</div>
				<h5>Все юзеры</h5>
				<table class="table">
					<tr>
						<th>#</th>
						<th>Имя</th>
						<th>Телефон</th>
						<th>Адрес</th>
						<th>Паспорт</th>
						<th>Регистрация</th>
						<th>Права</th>
					</tr>
					<tr v-for="(item, index) in users">
						<td>{{ index+1}}</td>
						<td>
							{{ item.name }} <p v-if="authUser.data.data.id == item.id">(вы)</p>
						</td>
						<td>{{ item.phone }}</td>
						<td>{{ item.address }}</td>
						<td>{{ item.passport }}</td>
						<td>{{ item.created_at }}</td>
						<td v-if="authUser.data.data.id !== item.id">
							<p :class="{'active': item.role == 1}" v-on:click="update (1, item.id, index)">модератор</p>
							<p :class="{'active': item.role == 2}" v-on:click="update (2, item.id, index)">админ</p>
							<p :class="{'active': item.role == 0}" v-on:click="update (0, item.id, index)">обычный</p>
						</td>
						<td v-if="authUser.data.data.id == item.id">
							Себе права не меняются
						</td>
					</tr>
				</table>
				<div class="preloader" v-show="preload"></div>
			</div>
			<div class="modal-inner" v-if="denied">
				<div class="alert bg-danger text-danger" >
					<div class="close" @click="close">&times;</div>
					У вас нет прав доступа !
				</div>
			</div>
		</div>
	</transition>
</template>



<script>
	import { ipDomain, getHeader } from '~/config.js'

	export default {
		data () {
			return {
				users: [],
				preload: true,
				denied: false
			}
		},
		computed: {
			authUser () {return this.$store.state.userStore.authUser}
		},
		methods: {
			close () {
				this.$emit('close')
			},
			update (role, id, index) {
				this.preload = true
				this.$http.post(ipDomain + 'api/status', {role: role, id: id}, {headers: getHeader()})
					.then(response => {
						if (response.status === 200) {
							this.users[index].role = role
							this.preload = false
						}
					}, error => {
						if (error.status === 401) {
							this.denied = true;
							this.preload = false
						}
					})
			}
		},
		created () {
			this.$http.get(ipDomain + 'api/users', {headers: getHeader()})
				.then(response => {
					if (response.status === 200) {
						this.users = response.data
						this.preload = false
					}
				}, error => {
					if (error.status === 401) {
						this.denied = true;
						this.preload = false
					}
				})
		}
	}
</script>