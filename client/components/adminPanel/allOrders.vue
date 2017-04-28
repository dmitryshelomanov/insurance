<template>
	<transition name="bounce">
		<div class="modal-wrapper">
			<div class="modal-inner" v-if="!denied">
				<div class="close" @click="close">&times;</div>
				<h5>Все заказы</h5>
				<table class="table">
					<tr>
						<th>
							#
						</th>
						<th>
							Услуга
						</th>
						<th>
							Имя агента
						</th>
						<th>
							Имя заказчика
						</th>
						<th>
							Адрес заказчика
						</th>
						<th>
							Дата заказа
							<i class="fa fa-chevron-up" 
								v-if="sortDate"
								@click="strategySort('created_at', 'asc')"></i>

							<i class="fa fa-chevron-down" 
								v-if="!sortDate"
								@click="strategySort('created_at', 'desc')"></i>
						</th>
						<th>
							Статус
						</th>
					</tr>
					<tr v-for="(item, index) in orders">
						<td>{{ index+1 }}</td>
						<td>{{ item.insurance.name }}</td>
						<td>{{ item.agent.name }}</td>
						<td>{{ item.user.name }}</td>
						<td>{{ item.user.address }}</td>
						<td>{{ item.created_at }}</td>
						<td @click="status(index)">
							<i class="fa fa-ban fw" v-if="item.status === 0"></i>
							<i class="fa fa-check-square-o" v-if="item.status"></i>
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
	import helperSort from '~/helpers/sort.js';	

	export default {
		data () {
			return {
				orders: [],
				preload: true,
				denied: false,
				sortDate: false
			}
		},
		methods: {
			close () {
				this.$emit('close')
			},
			status(index) {
				this.preload = true
				const data = {
					id: this.orders[index].id,
					status: null,
				}
				if (this.orders[index].status === 0) {
					data.status = 1;
					this.$http.post(`${ipDomain}api/update/status/order`, data, {headers: getHeader()})
						.then(response => {
							if (response.status === 200) {
								this.orders[index].status = 1;
								this.preload = false;
							}
						})
					return true;
				}
				data.status = 0
				this.$http.post(`${ipDomain}api/update/status/order`, data, {headers: getHeader()})
					.then(response => {
						if (response.status === 200) {
							this.orders[index].status = 0;
							this.preload = false;
						}
					})
			},
			sortcreated_at(){
				this.sortDate = !this.sortDate;
			},
			strategySort(field, method){
				helperSort(this.orders, field, method, this[`sort${field}`]);
			}
		},
		created () {
			this.$http.get(`${ipDomain}api/all/orders`, {headers: getHeader()})
				.then(response => {
					if (response.status === 200) {
						this.orders = response.data;
						console.log(response.data);
						this.preload = false;
					}
				}, error => {
				if (error.status === 401) {
					this.denied = true;
					this.preload = false;
				}
			})
		}
	}
</script>