const express = require('express');
const router = express.Router();
const roleController = require('../controllers/roleController');

router.get('/', roleController.getAllRoles);
router.post('/', roleController.createRole);
router.get('/:name', roleController.getRoleByName);
router.put('/:name', roleController.updateRole);
router.delete('/:name', roleController.deleteRole);

module.exports = router;
