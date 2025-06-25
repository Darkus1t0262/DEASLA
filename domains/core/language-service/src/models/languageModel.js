const mongoose = require('mongoose');

const LanguageSchema = new mongoose.Schema({
    code: { type: String, required: true, unique: true },
    name: { type: String, required: true },
    active: { type: Boolean, default: true }
});

const Language = mongoose.model('Language', LanguageSchema);

module.exports = Language;
