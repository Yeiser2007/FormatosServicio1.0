const helpers = {};
const byc = require('bcryptjs');
helpers.encryptPassword = async (password) =>{
    const salt = await byc.genSalt(10);
    const finallyPassword = await byc.hash(password,salt);
    return finallyPassword;
}

helpers.matchPassword = async (password,savePasseword) =>{
  try {
     await byc.compare(password,savePasseword);
  } catch (error) {
        console.log(error);
  }
   
}

module.exports = helpers;