const userRepository = require('../repositories/userRepository');

exports.createUser = async (req, res) => {
    const { username, email } = req.body;
    try {
        const user = await userRepository.createUser({ username, email });
        res.status(201).json(user);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

exports.getAllUsers = async (req, res) => {
    const users = await userRepository.getAllUsers();
    res.json(users);
};

exports.getUserById = async (req, res) => {
    const { id } = req.params;
    const user = await userRepository.getUserById(id);
    if (!user) return res.status(404).json({ message: 'User not found' });
    res.json(user);
};

exports.updateUser = async (req, res) => {
    const { id } = req.params;
    const { username, email } = req.body;
    const user = await userRepository.updateUser(id, { username, email });
    if (!user) return res.status(404).json({ message: 'User not found' });
    res.json(user);
};

exports.deleteUser = async (req, res) => {
    const { id } = req.params;
    const deleted = await userRepository.deleteUser(id);
    if (!deleted) return res.status(404).json({ message: 'User not found' });
    res.status(204).end();
};
