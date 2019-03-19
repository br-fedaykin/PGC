const CoinKey = require('coinkey')
const Message = require('./Message.js')

let bitcoinKey = CoinKey.createRandom()

let msg = new Message.Message('teste')

msg.encrypt(bitcoinKey.publicKey)
  .then((encrypted) => {
    console.log(`encrypted object: ${encrypted}`)
  })
  .then(function () {
    msg.decrypt(bitcoinKey.privateKey)
      .then((plaintext) => {
        console.log(`plaintext: ${plaintext}`)
      })
  })
