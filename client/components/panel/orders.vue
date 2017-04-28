<template>
	<transition name="fade">
		<div class="modal-wrapper">
			<div class="modal-inner">
				<div class="close" @click="close">&times;</div>
				<h5>Все заказы</h5>
				<table class="table">
					<tr>
						<th>
							#
						</th>
						<th>
							Страховка
						</th>
						<th>
							Агент
						</th>
						<th>
							Дата заявки
							<i class="fa fa-chevron-up" 
								v-if="sortDate"
								@click="strategySort('created_at', 'asc')"></i>

							<i class="fa fa-chevron-down" 
								v-if="!sortDate"
								@click="strategySort('created_at', 'desc')"></i>
						</th>
						<th>
							Длительность (мес)
							<i class="fa fa-chevron-up" 
								v-if="sortDuration"
								@click="strategySort('duration', 'asc')"></i>

							<i class="fa fa-chevron-down" 
								v-if="!sortDuration"
								@click="strategySort('duration', 'desc')"></i>
						</th>
						<th>
							Статус
						</th>
					</tr>
					<tr v-for="(item, index) in allOrders">
						<td>{{ index+1 }}</td>
						<td>
							{{ item.insurance.name }}
						</td>
						<td>
							{{ item.agent.name }}
						</td>
						<td>
							{{ item.created_at }}
						</td>
						<td>
							{{ item.duration }}
						</td>
						<td>
							<i class="fa fa-ban fw" v-if="item.status === 0"></i>
							<i class="fa fa-check-square-o" v-if="item.status"></i>
						</td>
					</tr>
				</table>
				<div class="preloader" v-show="preload"></div>
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
				allOrders: [],
				preload: true,
				sortDate: false,
				sortDuration: false
			}
		},
		methods: {
			close () {
				this.$emit('close');
			},
			sortcreated_at(){
				this.sortDate = !this.sortDate;
			},
			sortduration(){
				this.sortDuration = !this.sortDuration;
			},
			strategySort(field, method){
				helperSort(this.allOrders, field, method, this[`sort${field}`]);
			}
		},
		created () {
			this.$http.get(`${ipDomain}api/user`, {headers: getHeader()})
				.then(response => {
					if (response.status === 200) {
						this.$http.get(`${ipDomain}api/orders/${response.data.id}`, {headers: getHeader()})
							.then(response => {
								if (response.status === 200) {
									this.allOrders = response.data;
									this.preload = false;
								}
							})
					}
				})
		}
	}
</script>