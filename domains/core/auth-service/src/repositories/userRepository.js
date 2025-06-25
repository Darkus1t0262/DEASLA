const User = require('../models/userModel');

class UserRepository {
    // Repository pattern
    async createUser(data) {
        return await User.create(data);
    }

    async findByUsername(username) {
        return await User.findOne({ where: { username } });
    }
}

module.exports = new UserRepository();
