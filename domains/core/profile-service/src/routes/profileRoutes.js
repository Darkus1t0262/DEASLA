const express = require('express');
const router = express.Router();
const { getUsers } = require('../controllers/profileController');

router.get('/', getUsers);

module.exports = router;
