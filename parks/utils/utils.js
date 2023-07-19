export function back() {
	let time = setInterval(() => {
		clearInterval(time);
		uni.navigateBack();
	}, 2000);
}
