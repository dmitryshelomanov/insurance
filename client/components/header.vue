<template>
	<header>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<nav class="pull-right">
						<ul>
							<li>
								<nuxt-link	:to="{name: 'index'}">Главная</nuxt-link>
							</li>
							<li>
								<nuxt-link	:to="{name: 'about'}">О нас</nuxt-link>
							</li>
							<li @click="showChild">
								Страховка
								<ul class="clearfix" v-show="child">
									<li @contextmenu.prevent="deleted(item.id, index)" v-for="(item, index) in insurance">
										<nuxt-link	:to="{name: 'insurance-id', 
													params: {id: item.id}}">
											{{ item.name }}
										</nuxt-link>
									</li>
								</ul>
							</li>
							<li>
								<nuxt-link	:to="{name: 'faq'}">Помощь</nuxt-link>
							</li>
							<li v-show="!authUser.auth">
								<nuxt-link	:to="{name: 'auth'}" class="button">Вход</nuxt-link>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
</template>

<script>
	import { ipDomain, getHeader } from '~/config.js'

	export default {
		data () {
			return {
				child: false,
				insurance: []
			}
		},
		computed: {
             authUser () { return this.$store.state.userStore.authUser }
		},
		methods: {
			showChild () {
				if (this.child === true) {
					this.child = false
					return true 
				}
				this.child = true
				this.$http.get(ipDomain + 'api/insurance')
				.then(response => {
					if (response.status === 200) {
						this.insurance = response.data
					}
				})
			},
			deleted (id, index) {
				// this.$http.post(``, id, {headers: getHeader()})
				// 	.then(response => {
				// 		this.insurance.splice(index, 1);
				// 	});
			}
		}
	}
</script>