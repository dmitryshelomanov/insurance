<template>
	<div>
		<i class="fa fa-bell-o open" @click="show = !show"></i>
		<transition name="slide-fade">
			<div class="settings right" v-show="show">
				<h4><span>Уведомления</span></h4>
				<div class="push">
					<h4>
						<a href="">Новость А</a>
					</h4>
					<p class="refresh">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero repellendus quis animi, fugit aliquid, obcaecati voluptate autem fuga sint perferendis, asperiores. Inventore perferendis, error vel. Qui nihil, soluta porro amet.
					</p>
				</div>
			</div>
		</transition>
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
</style>

<script>
	export default {
		data () {
			return {
				show: false
			}
		}
	}
</script>