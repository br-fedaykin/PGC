const Message = require('./Message.js')
const eccrypto = require('eccrypto')

/**
 * Class representing an Agent on the ABE scheme
 */
class Agent {
  /**
   * creates an Agent to act on an ABE system
   * @param {string} name - the agent name
   * @param {Buffer} privateKey - an unique identifier number for agent
   */
  constructor (name, privateKey = '') {
    this.name = name
    this.privateKey = privateKey
  }

  /**
   * sends a message to an Agent
   */
  sendMessage (text, name, publicKeys) {
    console.log(`${this.name} sent message to ${name}: "${text}"`)
    return new Message.Message(text).encrypt(publicKeys[name])
  }

  /**
   * reads a message sent to the Agent
   */
  receiveMessage (message) {
    console.log(`encrypted message: ${message.content.ciphertext.toString('hex')}`)
    return eccrypto.decrypt(this.privateKey, message.content)
      .then((plaintext) => {
        console.log(`${this.name} decrypts message: "${plaintext}"`)
        message.content = plaintext
        return message
      })
  }
}

module.exports.Agent = Agent
