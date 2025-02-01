class Endpoints {
  static const baseUrl = String.fromEnvironment('BASE_URL');
  static const apiUrl = String.fromEnvironment('API_URL');
  static const apiSecurityKey = String.fromEnvironment('SECURITY_KEY');

  static const microsoftAuth = '/auth/microsoft';

  static const postPersonalInfo = '/user/personalInfo';
  static const getPersonalInfo = '/user/personalInfo';
  static const postProfileImage = '/uploadImage';
  /// /deleteImage/photoId
  static const deleteProfileImage = '/deleteImage';
  static const postUserProfile = '/user/profile';
  static const getUserProfile = '/user/profile/email'; // + '/${email}'
  static const getPaginatedUserProfiles = '/user/profile/page'; // + '/${pageNumber}'
  static const updateUserProfile = '/user/profile';

  static const addCrush = '/crush/add';
  static const getCrush = '/crush';
  static const removeCrush = '/crush/remove';
  static const getCrushesCount = '/crush/getCount';
  static const increaseCrushesCount = '/crush/increaseCount';
  static const decreaseCrushesCount = '/crush/decreaseCount';

  static const getMatch = '/match';

  static const reportUser = '/report/add';
  static const getBlockedUsers = '/report/blockedUsers';
  static const unblockUser = '/report/unblock';

  static const regenerateToken = '/auth/refreshToken';

  static getHeader() {
    return {'Content-Type': 'application/json', 'security-key': Endpoints.apiSecurityKey};
  }
}
