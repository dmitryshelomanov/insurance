<template>
	<transition name="fade">
		<div class="modal-wrapper">
			<div class="modal-inner">
				<div class="close" @click="close">&times;</div>
				<h5>Личные данные</h5>
				<span>
					Логин
					<input type="text" :value="authUser.data.data.login" class="form-control" disabled>
				</span>
				<span>
					Имя
					<input type="text" :value="authUser.data.data.name" class="form-control">
				</span>
				<span>
					Адрес
					<input type="text" :value="authUser.data.data.address" class="form-control">
				</span>
				<span>
					Паспорт
					<input type="number" :value="authUser.data.data.passport" class="form-control">
				</span>
				<span>
					Телефон
					<input type="number" :value="authUser.data.data.phone" class="form-control">
				</span>
				<button class="btn btn-primary">
					<i class="fa fa-refresh"></i> изменить
				</button>
			</div>
		</div>
	</transition>
</template>

<script>
	export default {
		data () {
			return {
				
			}
		},
		computed: {
			 authUser () { return this.$store.state.userStore.authUser }
		},
		methods: {
			close () {
				this.$emit('close')
			}
		}
	}
</script>