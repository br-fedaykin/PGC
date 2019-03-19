const eccrypto = require('eccrypto')

class Message {
  /**
   * creates a Message object
   * @param {string} content - a message to be sent
   */
  constructor (content) {
    this.content = content
    this.encryptionKey = ''
  }

  /**
   * encrypts the message content
   * @param {Buffer} publicKey - the public key of who can decrypt the message
   * @return {Promise}
   */
  encrypt (publicKey) {
    if (!this.encryptionKey) {
      this.encryptionKey = publicKey
    }
    return eccrypto.encrypt(publicKey, Buffer.from(this.content))
      .then((encrypted) => {
        this.content = encrypted
        return this
      })
  }

  /**
   * encrypts the message content
   * @param {Buffer} privateKey - the key that decrypts the content of the msg
   */
  decrypt (privateKey) {
    return eccrypto.decrypt(privateKey, this.content)
      .then((plaintext) => {
        this.content = plaintext
        return this
      })
  }
}

module.exports.Message = Message
