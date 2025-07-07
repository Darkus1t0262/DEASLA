const Profile = require('../models/profileModel');

class ProfileRepository {
    async createProfile(data) {
        return await Profile.create(data);
    }

    async getAllProfiles() {
        return await Profile.find();
    }

    async getProfileById(id) {
        return await Profile.findById(id);
    }

    async updateProfile(id, data) {
        return await Profile.findByIdAndUpdate(id, data, { new: true });
    }

    async deleteProfile(id) {
        return await Profile.findByIdAndDelete(id);
    }
}

module.exports = new ProfileRepository();
