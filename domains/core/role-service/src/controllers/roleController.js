const roleRepository = require('../repositories/roleRepository');

exports.createRole = async (req, res) => {
    const { name, description } = req.body;
    try {
        const role = await roleRepository.createRole({ name, description });
        res.status(201).json(role);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

exports.getAllRoles = async (req, res) => {
    const roles = await roleRepository.getAllRoles();
    res.json(roles);
};

exports.getRoleByName = async (req, res) => {
    const { name } = req.params;
    const role = await roleRepository.getRoleByName(name);
    if (!role) return res.status(404).json({ message: 'Role not found' });
    res.json(role);
};

exports.updateRole = async (req, res) => {
    const { name } = req.params;
    const { description } = req.body;
    const role = await roleRepository.updateRole(name, { description });
    if (!role) return res.status(404).json({ message: 'Role not found' });
    res.json(role);
};

exports.deleteRole = async (req, res) => {
    const { name } = req.params;
    const deleted = await roleRepository.deleteRole(name);
    if (!deleted) return res.status(404).json({ message: 'Role not found' });
    res.status(204).end();
};
