# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org

console.log('here goes the codex')
$(document).ready(function() {
	console.log('here goes the codex')
	var $pubnub = new PubNub({
		publishKey : 'example',
		subscribeKey : 'example'
	});

	var post_id = "post_" + <%= current_user.id %>;
	console.log(post_id);

	#pubnub.subscribe({
		channels : [post_id]
	});

	$pubnub.addListener({
		message : function(post) {
			console.log(post.message['content']);
		}
	});

})