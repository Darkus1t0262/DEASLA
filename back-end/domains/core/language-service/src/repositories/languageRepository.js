const Language = require('../models/languageModel');

class LanguageRepository {
    async createLanguage(data) {
        return await Language.create(data);
    }

    async getAllLanguages() {
        return await Language.find();
    }

    async getLanguageById(id) {
        return await Language.findById(id);
    }

    async updateLanguage(id, data) {
        return await Language.findByIdAndUpdate(id, data, { new: true });
    }

    async deleteLanguage(id) {
        return await Language.findByIdAndDelete(id);
    }
}

module.exports = new LanguageRepository();
