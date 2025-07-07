const mongoose = require('mongoose');

const ProfileSchema = new mongoose.Schema({
    userId: { type: String, required: true, index: true },
    fullName: { type: String, required: true },
    phone: { type: String }
});

const Profile = mongoose.model('Profile', ProfileSchema);

module.exports = Profile;
