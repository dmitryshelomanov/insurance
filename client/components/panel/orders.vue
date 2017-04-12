<template>
	<transition name="fade">
		<div class="modal-wrapper">
			<div class="modal-inner">
				<div class="close" @click="close">&times;</div>
				<h5>Все заказы</h5>
				<table class="table">
					<tr>
						<th>#</th>
						<th>Страховка</th>
						<th>Агент</th>
						<th>Дата заявки</th>
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
					</tr>
				</table>
				<div class="preloader" v-show="preload"></div>
			</div>
		</div>
	</transition>
</template>

<script>
	import { ipDomain, getHeader } from '~/config.js'

	export default {
		data () {
			return {
				allOrders: [],
				preload: true
			}
		},
		methods: {
			close () {
				this.$emit('close')
			}
		},
		created () {
			this.$http.get(ipDomain + 'api/user', {headers: getHeader()})
				.then(response => {
					if (response.status === 200) {
						this.$http.get(ipDomain + 'api/orders/' + response.data.id, {headers: getHeader()})
							.then(response => {
								if (response.status === 200) {
									this.allOrders = response.data
									this.preload = false
								}
							})
					}
				})
		}
	}
</script>