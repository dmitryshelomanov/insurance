<template>
	<section style="padding-top: 100px">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h3>{{ insurance.name }}</h3>
					<i @click="edit" class="fa fa-edit" 
						v-if="authUser.auth && authUser.data.data.role == 1 || authUser.data.data.role == 2"></i>
					<div id="summernote" v-html="insurance.text"></div>
					<button class="btn btn-primary" v-if="is_edit" @click="destroy">изменить</button>
				</div>
			</div>
		</div>
	</section>
</template>
<script>
	import { ipDomain, getHeader } from '~/config.js'

	export default {
		layout: 'app',
		data () {
			return {
				insurance: {},
				data: '',
				is_edit: false
			}
		},
		computed: {
             authUser () { return this.$store.state.userStore.authUser }
		},
		methods: {
			edit () {
				this.is_edit = true
				$('#summernote').summernote({
					height: 480,
				});
			},
			destroy () {
				this.is_edit = false
				this.$http.post(ipDomain + 'api/insurance/' +this.$route.params.id, 
					{data: $('#summernote').summernote('code')}, 
					{headers: getHeader ()})
					.then(response => {
						if (response.status === 200) {
							$('#summernote').summernote('destroy');
						}
					})			
			},
		},
		mounted () {
			this.$http.get(ipDomain + 'api/insurance/' +this.$route.params.id, {headers: getHeader ()})
				.then(response => {
					if (response.status === 200) {
						this.insurance = response.data
					}
				})
		},
		watch: {
			'$route' () {
				this.$http.get(ipDomain + 'api/insurance/' +this.$route.params.id)
					.then(response => {
						if (response.status === 200) {
							this.insurance = response.data
						}
					})
			}
		}
	}
</script>

