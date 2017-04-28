<template>
	<div>
		<i class="fa fa-bell-o open" 
			@click="show.menu = !show.menu; alert = false; update = !update; show.preload = true" 
			:class="{'alert' : alert}"></i>
		<transition name="slide-fade">
			<div class="settings right" v-if="show.menu">
				<h4><span>Уведомления</span></h4>
				<div class="push" v-for="(item, index) in news">
					<i class="close" @click="deleted(index)" 
						v-if="authUser.auth && authUser.data.data.role == 2 || authUser.data.data.role == 1">&times;</i>
					<h6>{{ item.name }}</h6>
					<div class="refresh" v-substr="item.data">
					</div>
					<a @click.prevent="look(item.id)">подробнее</a>
				</div>
				<div class="preloader" v-show="show.preload"></div>
			</div>
		</transition>

		<div class="modal-wrapper" v-if="show.modal">
			<div class="modal-inner">
				<div class="close" @click="show.modal = !show.modal">&times;</div> <br>
				<h3>{{byId.name}}</h3>
				<p v-html="byId.data"></p>
				<div class="preloader" v-show="show.preloadModal"></div>
			</div>
		</div>
	</div>
</template>

<style scoped>
	i.open {
		position: fixed;
		top: 0;
		right: 0;
		padding: 15px;
		z-index: 5
	}
	i.open:hover {color: #e1594d;}
	.push p {
		font-size: 12px;
		padding-top: 0;
	}
	.push {
		border-bottom: 1px solid #eee
	}
	.slide-fade-enter-active {
		transition: all .3s ease;
	}
	.slide-fade-leave-active {
		transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);
	}
	.slide-fade-enter, .slide-fade-leave-to
		/* .slide-fade-leave-active для <2.1.8 */ {
		transform: translateX(100px);
		opacity: 0;
	}
	.alert {
		text-shadow: 3px 2px 7px red;
    	color: #e1594d !important;
	}
	h6 {
		font-weight: bold
	}
	a {
		cursor:pointer
	}
</style>

<script>
	import io from 'socket.io-client';
	import { ipDomain, getHeader } from '~/config.js'

	export default {
		data () {
			return {
				show: {
					modal: false,
					menu: false,
					preload: true,
					preloadModal: false
				},
				socket: null,
				news: [],
				alert: false,
				update: false,
				byId: null
			}
		},
		computed: {
             authUser () { return this.$store.state.userStore.authUser }
		},
		methods: {
            eventNews() {
                this.socket.on('newsClient', (data) => {
					this.alertMsg(data);
                });
            },
			alertMsg (data) {
				this.news.push(data);
				this.alert = true;
				const audio = new Audio();
				audio.src = '/sound/alert.wav';
				audio.play();
			},
			look (id) {
				this.show.modal = true;
				this.show.preloadModal = true;
				this.$http.get(`${ipDomain}api/news/${id}`)
					.then(response => {
						if (response.status === 200) {
							this.byId = response.data;
							this.show.preloadModal = false;
						}
					});
			},
			deleted(index)
			{
				this.$http.post(`${ipDomain}api/news/delete`, {id: this.news[index].id}, {headers: getHeader()})
					.then(response => {
						if (response.status === 200) {
							this.news.splice(index, 1);
						}
					});
			}
		},
		watch: {
			'update' (a, b) {
				console.log(a);
				this.$http.get(`${ipDomain}api/news/all`)
					.then(response => {
						if (response.status === 200) {
							this.news = response.data;
							this.show.preload = false;
						}
					});
			}
		},
		mounted () {
			if (process.BROWSER_BUILD) {
				this.socket = io(':6001');
				this.eventNews();
			}
		}
	}
</script>