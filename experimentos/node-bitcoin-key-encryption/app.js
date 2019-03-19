const CoinKey = require('coinkey')
const Agent = require('./Agent.js').Agent

// public information of the system
let publicKeys = []

// creating keys for Alice
let btcKey = CoinKey.createRandom()
let alice = new Agent('Alice', btcKey.privateKey)
publicKeys[alice.name] = btcKey.publicKey

// creating keys for Bob
btcKey = CoinKey.createRandom()
let bob = new Agent('Bob', btcKey.privateKey)
publicKeys[bob.name] = btcKey.publicKey

// sending example message
// BUG: if text has more than 14 chars, decrypt breaks
let msgText = 'test to Bob'

alice.sendMessage(msgText, bob.name, publicKeys)
  .then((msg) => {
    bob.receiveMessage(msg)
  })
