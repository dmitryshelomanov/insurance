<template>
	<transition name="bounce">
		<div class="modal-wrapper">
			<div class="modal-inner">
				<div class="close" @click="close">&times;</div>
				<div class="alert text-success bg-success" v-if="message.success">
					{{ message.data }}
				</div>
				<h5>Добавить страховку</h5>
				<div class="form-group">
					<label for="">Название</label>
					<input type="text" class="form-control" v-model="insurance.name">
				</div>
				<div class="form-group">
					<label for="">Стоимость</label>
					<input type="number" class="form-control" v-model="insurance.price">
				</div>
				<button class="btn btn-primary" @click="add">
					<i class="fa fa-plus"></i> добавить
				</button>
			</div>
		</div>
	</transition>
</template>

<script>
	import { ipDomain, getHeader } from '~/config.js'

	export default {
		data () {
			return {
				message: false,
				insurance: {
					name: '',
					price: 0
				}
			}
		},
		methods: {
			close () {
				this.$emit('close')
			},
			add () {
				this.$http.post(`${ipDomain}api/add/insurance`, this.insurance, {headers: getHeader ()})
					.then(response => {
						if (response.status === 200) {
							this.message = response.data
						}
					})
			}
		}
	}
</script>