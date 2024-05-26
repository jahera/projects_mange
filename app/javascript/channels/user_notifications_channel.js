import consumer from "./consumer"

consumer.subscriptions.create("UserNotificationsChannel", {
  connected() {
    console.log("Connected to UserNotificationsChannel")
  },

  disconnected() {
    console.log("Disconnected from UserNotificationsChannel")
  },

  received(data) {
    const notificationsElement = document.getElementById('notifications')
    if (notificationsElement) {
      notificationsElement.innerHTML += `<div class="notification">${data.message}</div>`
    }
  }
});
