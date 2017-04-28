<template>
	<div>
		<i class="fa fa-navicon open" @click="show.settings = !show.settings"></i>
		<transition name="slide-fade">
			<div class="settings left" v-show="show.settings">
				<h4><span>Заказ</span></h4>
				<ul>
					<li  @click="show.createOrder = !show.createOrder">
						<i class="fa fa-plus"></i>Сделать заказ
					</li>
					<li @click="show.allOrders = !show.allOrders">
						<i class="fa fa-folder-open"></i>Мои заказы
					</li>
					<li  @click="show.userData = !show.userData">
						<i class="fa fa-cog"></i>Личные данные
					</li>
					<li @click="logout">
						<i class="fa fa-sign-in"></i> Выход
					</li>
				</ul>
			</div>
		</transition>
		<createdOrder v-if="show.createOrder" @close="show.createOrder = false"/>
		<orders v-if="show.allOrders" @close="show.allOrders = false"/>
		<userData v-if="show.userData" @close="show.userData = false"/>
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
	import { ipDomain, getHeader } from '~/config.js';

	export default {
		data () {
			return {
				show: {
					settings: false,
					createOrder: false,
					allOrders: false,
					userData: false
				}
			}
		},
		methods: {
			logout () {
				this.$http.post(`${ipDomain}api/logout`, null, {headers: getHeader()})
					.then(response => {
						this.$storage.clear();
						this.$store.commit('userStore/SET_AUTH_USER', null);
					});
			}
		},
		components: {
			createdOrder: require('./createOrder.vue'),
			orders: require('./orders.vue'),
			userData: require('./userData.vue')
		}
	}
</script>