const languageRepository = require('../repositories/languageRepository');

exports.createLanguage = async (req, res) => {
    const { code, name, active } = req.body;
    try {
        const language = await languageRepository.createLanguage({ code, name, active });
        res.status(201).json(language);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

exports.getAllLanguages = async (req, res) => {
    const languages = await languageRepository.getAllLanguages();
    res.json(languages);
};

exports.getLanguageById = async (req, res) => {
    const { id } = req.params;
    const language = await languageRepository.getLanguageById(id);
    if (!language) return res.status(404).json({ message: 'Language not found' });
    res.json(language);
};

exports.updateLanguage = async (req, res) => {
    const { id } = req.params;
    const { code, name, active } = req.body;
    const language = await languageRepository.updateLanguage(id, { code, name, active });
    if (!language) return res.status(404).json({ message: 'Language not found' });
    res.json(language);
};

exports.deleteLanguage = async (req, res) => {
    const { id } = req.params;
    const deleted = await languageRepository.deleteLanguage(id);
    if (!deleted) return res.status(404).json({ message: 'Language not found' });
    res.status(204).end();
};
