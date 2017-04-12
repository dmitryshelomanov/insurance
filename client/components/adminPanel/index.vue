<template>
	<div>
		<i class="fa fa-gears open" @click="show.panel = !show.panel "></i>
		<transition name="slide-fade">
			<div class="settings left" v-show="show.panel">
				<h4><span>Управление</span></h4>
				<ul>
					<li @click="show.insurance = true">
						<i class="fa fa-plus"></i>Добавить страховку
					</li>
					<li  @click="show.agent = true">
						<i class="fa fa-plus"></i>Добавить агента
					</li>
					<li @click="show.allOrders = true">
						<i class="fa fa-bell"></i>Заказы
					</li>
					<li @click="show.allUsers = true">
						<i class="fa fa-users"></i>Пользователи
					</li>
					<li @click="logout">
						<i class="fa fa-sign-in"></i> Выход
					</li>
				</ul>
			</div>
		</transition>
		<users v-if="show.allUsers" @close="show.allUsers = false"/>
		<orders v-if="show.allOrders" @close="show.allOrders = false"/>
		<addAgent v-if="show.agent" @close="show.agent = false"/>
		<add-insurance v-if="show.insurance" @close="show.insurance = false"/>
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
		transform: translateX(-100px);
		opacity: 0;
	}
</style>

<script>
	import { ipDomain, getHeader } from '~/config.js'

	export default {
		data () {
			return {
				show: {
					panel: false,
					allUsers: false,
					allOrders: false,
					agent: false,
					insurance: false,
				}
			}
		},
		methods: {
			logout () {
				window.localStorage.setItem('authUser', null);
				this.$store.commit('userStore/SET_AUTH_USER', null)
			}
		},
		components: {
			users: require('./users.vue'),
			orders: require('./allOrders.vue'),
			addAgent: require('./addAgent.vue'),
			addInsurance: require('./addInsurance.vue')
		}
	}
</script>
