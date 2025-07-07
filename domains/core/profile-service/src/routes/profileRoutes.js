const express = require('express');
const router = express.Router();
const {
  getAllProfiles,
  createProfile,
  getProfileById,
  updateProfile,
  deleteProfile
} = require('../controllers/profileController');

router.get('/', getAllProfiles);
router.post('/', createProfile);
router.get('/:id', getProfileById);
router.put('/:id', updateProfile);
router.delete('/:id', deleteProfile);

module.exports = router;
