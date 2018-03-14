namespace java com.oyo.metadata

enum TStatus {
	SUCCESS,
	FAILURE
}

struct TPackageDestination {
	1: string id,
	2: string name
}

struct TPackageCity {
	1: string id,
	2: string name
}

struct TPackageDuration {
	1: string id,
	2: string name
}

struct TMonth {
	1: string id,
	2: string name
}

struct TBlog {
	1: string id,
	2: string cmsId
}

struct TUserStory {
	1: string id,
	2: string cmsId
}

struct TPackageInclusion {
	1: string id,
	2: string name
}

struct TPackageExclusion {
	1: string id,
	2: string name
}

struct TRestriction {
	1: string id,
	2: string name
}

struct TAmenity {
	1: string id,
	2: string name
}

struct TPackageTags {
	1: string id,
	2: string name
}

struct THotelCategory {
	1: string id,
	2: string name
}

struct TRoomCategory {
	1: string id,
	2: string name
}

struct TMiceTags {
	1: string id,
	2: string name
}

struct TMiceEventType {
	1: string id,
	2: string name
}

struct TMiceCity {
	1: string id,
	2: string name
}

struct TPropertyLevel {
	1: string id,
	2: string name
}

struct TToiletConfiguration {
	1: string id,
	2: string name
}

struct TPaymentPolicy {
	1: string id,
	2: string description,
	3: map<string,string> policyRule
}

struct TCancellationPolicy {
	1: string id,
	2: string description,
	3: map<string,string> policyRule
}

struct THotSellingPackage {
	1: string id;
	2: string catalogId;
}

struct TPopularPackage {
	1: string id;
	2: string catalogId;
}

struct TOtherRecommendedPackage {
	1: string id;
	2: string catalogId;
}

struct TOtherDestinationToExplore {
	1: string id;
	2: string catalogId;
}


// GET PackageDetails Destination response
struct TPackageDestinationResponse {
	1: TPackageDestination packageDestination,
	2: TStatus status,
	3: map<string, string> errorList
}

// GET PackageDetails City response
struct TPackageCityResponse {
	1: TPackageCity packageCity,
	2: TStatus status,
	3: map<string, string> errorList
}

struct TPackageDurationResponse {
	1: TPackageDuration packageDuration,
	2: TStatus status,
  3: map<string, string> errorList
}

struct TMonthResponse {
	1: TMonth month,
	2: TStatus status,
	3: map<string, string> errorList
}

struct TBlogResponse {
	1: TBlog blog,
	2: TStatus status,
	3: map<string, string> errorList
}

struct TUserStoryResponse {
	1: TUserStory userStory,
	2: TStatus status,
	3: map<string, string> errorList
}

// GET PackageDetails Inclusion response
struct TPackageInclusionResponse {
	1: TPackageInclusion packageInclusion,
	2: TStatus status,
	3: map<string, string> errorList
}

// GET PackageDetails Exclusion response
struct TPackageExclusionResponse {
	1: TPackageExclusion packageExclusion,
	2: TStatus status,
	3: map<string, string> errorList
}

// GET Restriction response
struct TRestrictionResponse {
	1: TRestriction restriction,
	2: TStatus status,
	3: map<string, string> errorList
}

// GET Amenity response
struct TAmenityResponse {
	1: TAmenity amenity,
	2: TStatus status,
	3: map<string, string> errorList
}

// GET Hotel Category response
struct THotelCategoryResponse {
	1: THotelCategory hotelCategory,
	2: TStatus status,
	3: map<string, string> errorList
}

// GET Room Category response
struct TRoomCategoryResponse {
	1: TRoomCategory roomCategory,
	2: TStatus status,
	3: map<string, string> errorList
}

// GET Tags response
struct TPackageTagsResponse {
	1: TPackageTags packageTags,
	2: TStatus status,
	3: map<string, string> errorList
}

struct TMiceTagsResponse {
	1: TMiceTags miceTags,
	2: TStatus status,
	3: map<string, string> errorList
}

// GET Mice Event response
struct TMiceEventTypeResponse {
	1: TMiceEventType eventType,
	2: TStatus status,
	3: map<string, string> errorList
}

// GET Mice City response
struct TMiceCityResponse {
	1: TMiceCity miceCity,
	2: TStatus status,
	3: map<string, string> errorList
}

// GET Level response
struct TPropertyLevelResponse {
	1: TPropertyLevel propertyLevel,
	2: TStatus status,
	3: map<string, string> errorList
}

// GET Toilet Configuration response
struct TToiletConfigurationResponse {
	1: TToiletConfiguration toilet,
	2: TStatus status,
	3: map<string, string> errorList
}

// GET policy response
struct TPaymentPolicyResponse {
	1: TPaymentPolicy paymentPolicy,
	2: TStatus status,
	3: map<string, string> errorList
}

struct TCancellationPolicyResponse {
	1: TCancellationPolicy cancellationPolicy,
	2: TStatus status,
	3: map<string, string> errorList
}

struct THotSellingPackageResponse {
	1: THotSellingPackage hotSellingPacakge,
	2: TStatus status,
	3: map<string, string> errorList
}

struct TPopularPackageResponse {
	1: TPopularPackage popularPackage,
	2: TStatus status,
	3: map<string, string> errorList
}

struct TOtherRecommendedPackageResponse {
	1: TOtherRecommendedPackage otherPackage,
	2: TStatus status,
	3: map<string, string> errorList
}

struct TOtherDestinationToExploreResponse {
	1: TOtherDestinationToExplore otherDestination,
	2: TStatus status,
	3: map<string, string> errorList
}


service TMetaDataService{

	// GET operation
	TPackageDestinationResponse getPackageDestination(1: string metaDataId, 2: string locale);
	// LIST operation
	list<TPackageDestinationResponse> listPackageDestination(1: string locale);
	// 	CREATE operation
	TPackageDestinationResponse createPackageDestination(1: TPackageDestination packageDestinationData, 2: string locale);


	TPackageCityResponse getPackageCity(1: string metaDataId, 2: string locale);
	list<TPackageCityResponse> listPackageCity(1: string locale);
	TPackageCityResponse createPackageCity(1: TPackageCity packageCityData, 2: string locale);

	list<TPackageDurationResponse> listPackageDurations(1: string locale);

	list<TMonthResponse> listMonths(1: string locale);

	list<TBlogResponse> listBlogs(1: string locale);

	list<TUserStoryResponse> listUserStories(1: string locale);

	TPackageInclusionResponse getPackageInclusion(1: string metaDataId, 2: string locale);
	list<TPackageInclusionResponse> listPackageInclusion(1: string locale);
	TPackageInclusionResponse createPackageInclusion(1: TPackageInclusion packageInclusionData, 2: string locale);


	TPackageExclusionResponse getPackageExclusion(1: string metaDataId, 2: string locale);
	list<TPackageExclusionResponse> listPackageExclusion(1: string locale);
	TPackageExclusionResponse createPackageExclusion(1: TPackageExclusion packageExclusionData, 2: string locale);


	TRestrictionResponse getRestriction(1: string metaDataId, 2: string locale);
	list<TRestrictionResponse> listRestriction(1: string locale);
	TRestrictionResponse createRestriction(1: TRestriction restrictionData, 2: string locale);


	TAmenityResponse getAmenity(1: string metaDataId, 2: string locale);
	list<TAmenityResponse> listAmenity(1: string locale);
	TAmenityResponse createAmenity(1: TAmenity amenityData, 2: string locale);


	TPackageTagsResponse getPackageTags(1: string metaDataId, 2: string locale);
	list<TPackageTagsResponse> listPackageTags(1: string locale);
	TPackageTagsResponse createPackageTags(1: TPackageTags packageTagsData, 2: string locale);


	THotelCategoryResponse getHotelCategory(1: string metaDataId, 2: string locale);
	list<THotelCategoryResponse> listHotelCategory(1: string locale);
	THotelCategoryResponse createHotelCategory(1: THotelCategory hotelCategoryData, 2: string locale);


	TRoomCategoryResponse getRoomCategory(1: string metaDataId, 2: string locale);
	list<TRoomCategoryResponse> listRoomCategory(1: string locale);
	TRoomCategoryResponse createRoomCategory(1: TRoomCategory roomCategoryData, 2: string locale);


	TMiceTagsResponse getMiceTags(1: string metaDataId, 2: string locale);
	list<TMiceTagsResponse> listMiceTags(1: string locale);
	TMiceTagsResponse createMiceTags(1: TMiceTags miceTagsData, 2: string locale);


	TMiceEventTypeResponse getMiceEventType(1: string metaDataId, 2: string locale);
	list<TMiceEventTypeResponse> listMiceEventType(1: string locale);
	TMiceEventTypeResponse createMiceEventType(1: TMiceEventType miceEventTypeData, 2: string locale);


	TMiceCityResponse getMiceCity(1: string metaDataId, 2: string locale);
	list<TMiceCityResponse> listMiceCity(1: string locale);
	TMiceCityResponse createMiceCity(1: TMiceCity miceCityData, 2: string locale);


	TPropertyLevelResponse getPropertyLevel(1: string metaDataId, 2: string locale);
	list<TPropertyLevelResponse> listPropertyLevel(1: string locale);
	TPropertyLevelResponse createPropertyLevel(1: TPropertyLevel propertyLevelData, 2: string locale);


	TToiletConfigurationResponse getToiletConfiguration(1: string metaDataId, 2: string locale);
	list<TToiletConfigurationResponse> listToiletConfiguration(1: string locale);
	TToiletConfigurationResponse createToilet(1: TToiletConfigurationResponse toiletData, 2: string locale);

	// Policy APIs

	TPaymentPolicyResponse getPaymentPolicy(1: string metaDataId, 2: string locale);
	list<TPaymentPolicyResponse> listPaymentPolicies(1: string locale);
	TPaymentPolicyResponse createPaymentPolicy(1: TPaymentPolicy paymentPolicyData, 2: string locale);

	TCancellationPolicyResponse getCancellationPolicy(1: string metaDataId, 2: string locale);
	list<TCancellationPolicyResponse> listCancellationPolicies(1: string locale);
	TCancellationPolicyResponse createCancellationPolicy(1: TCancellationPolicy cancellationPolicyData, 2: string locale);

 	// Catalog collection APIs

	list<THotSellingPackageResponse> listHotSellingPackage(1: string locale);
	THotSellingPackageResponse createHotSellingPackages(1: string catalogId, 2: string locale);


	list<TPopularPackageResponse> listPopularPackages(1: string locale);
	TPopularPackageResponse createPopularPackage(1: string catalogId, 2: string locale);

	list<TOtherRecommendedPackageResponse> listOtherRecommendedPackages(1: string locale);
	TOtherRecommendedPackageResponse createOtherRecommendedPackage(1: string catalogId, 2: string locale);

	list<TOtherDestinationToExploreResponse> listOtherDestinationsToExplore(1: string locale);
	TOtherDestinationToExploreResponse createOtherDestinationToExplore(1: string catalogId, 2: string locale);

}
