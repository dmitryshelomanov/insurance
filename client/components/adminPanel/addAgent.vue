<template>
	<transition name="bounce">
		<div class="modal-wrapper">
			<div class="modal-inner">
				<div class="close" @click="close">&times;</div>
				<div class="alert bg-danger text-danger" v-if="denied">
					У вас нет прав доступа !
				</div>
				<div class="alert text-success bg-success" v-if="success">
					{{ success.data }}
				</div>
				<h5>Добавить агента</h5>
				<div class="form-group">
					<label for="">Имя</label>
					<input type="text" class="form-control" v-model="agent.name">
				</div>
				<div class="form-group">
					<label for="">Телефон</label>
					<input type="number" class="form-control" v-model="agent.phone">
				</div>
				<div class="form-group">
					<label for="">Описание</label>
					<textarea class="form-control"rows="5" v-model="agent.text"></textarea>
				</div>
				<button class="btn btn-primary" @click="addAgent">
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
				success: false,
				agent: {
					name: '',
					phone: null,
					text: ''
				},
				denied: false
			}
		},
		methods: {
			close () {
				this.$emit('close')
			},
			addAgent () {
				this.$http.post(ipDomain + 'api/add/agent', this.agent, {headers: getHeader()})
					.then(response => {
						if (response.status === 200) {
							this.success = response.data
						}
					}, error => {
						if (error.status === 401) {
							this.denied = true;
						}
					})
			}
		}
	}
</script>