<template>
	<transition name="fade">
		<div class="modal-wrapper">
			<div class="modal-inner">
				<div class="close" @click="close">&times;</div>
				<div class="alert bg-success text-success" v-if="messages.success">
					{{ messages.data }}
				</div>
				<div class="alert bg-danger text-danger" v-if="messages.success === false">
					{{ messages.data }}
				</div>
				<h5>Сделать заказ</h5>
				<div class="form-group">
					<label for="">Вид страховки</label>
					<select class="form-control" v-model="createOrder.insurance">
						<option v-for="item in insurance" :value="item.id">
							{{ item.name }}
						</option>
					</select>
				</div>
				<div class="form-group">
					<label for="">Агент</label>
					<select class="form-control"  v-model="createOrder.agent">
						<option v-for="item in agents" :value="item.id">
							{{ item.name }}
						</option>
					</select>
				</div>
				<div class="form-group">
					<label for="">Количество месяцов</label>
					<input type="number" class="form-control" v-model="createOrder.duration">
				</div>
				<div class="form-group">
					<label for="">Цена</label>
					<input type="text" :value="price ? price + ' руб' : '0 руб'" class="form-control" disabled>
				</div>
				<button class="btn btn-default" @click="saveOrder">
					<i class="fa fa-plus"></i>Заказать
				</button>
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
				messages: {
					saccess: null,
					data: ''
				},
				createOrder: {
					insurance: '',
					agent: '',
					price: 0,
					duration: 1
				},
				agents: [],
				insurance: [],
				preload: true
			}
		},
		computed: {
			price () {
				for (let i = 0; i < this.insurance.length; i++) {
					if (this.insurance[i].id === this.createOrder.insurance) {
						this.createOrder.price = this.insurance[i].price * this.createOrder.duration
						return this.insurance[i].price * this.createOrder.duration
					}
				}
			}
		},
		methods: {
			saveOrder () {
				this.preload = true
				this.$http.get(ipDomain + 'api/user', {headers: getHeader()})
					.then(response => {
						if (response.status === 200) {
							this.createOrder.user_id = response.data.id
							this.$http.post(ipDomain + 'api/orders', this.createOrder, {headers: getHeader()})
								.then(response => {
									if (response.status === 200) {
										this.messages = response.data
										this.preload = false
									}
								})
						}
					})
			},
			close () {
				this.$emit('close')
			}
		},
		created () {
			this.$http.get(ipDomain + 'api/agents')
			.then(response => {
				if (response.status === 200) {
					this.agents = response.data
					this.$http.get(ipDomain + 'api/insurance')
					.then(response => {
						if (response.status === 200) {this.insurance = response.data}
							this.preload = false
					})
				}
			})
		}
	}
</script>