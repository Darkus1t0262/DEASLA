const User = require('../models/userModel');

class UserRepository {
    async createUser(data) {
        return await User.create(data);
    }

    async getAllUsers() {
        return await User.findAll();
    }

    async getUserById(id) {
        return await User.findByPk(id);
    }

    async updateUser(id, data) {
        const user = await User.findByPk(id);
        if (!user) return null;
        await user.update(data);
        return user;
    }

    async deleteUser(id) {
        const user = await User.findByPk(id);
        if (!user) return null;
        await user.destroy();
        return true;
    }
}

module.exports = new UserRepository();
