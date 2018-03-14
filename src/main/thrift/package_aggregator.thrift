namespace java com.oyo.aggregation.packages

enum TStatus {
	SUCCESS,
	FAILURE
}

struct TDestination {
	1: string id;
	2: string name;
}

struct TCity {
	1: string id;
	2: string name;
}

struct TPrice {
  1: double originalPrice;
  2: bool valueDeal;
  3: double discountPercentage;		// should be zero if no discount
  4: double afterDiscountPrice;		// should be assigned the originalPrice if Zero discount
}

struct TMapLocation {
	1: double latitude,
	2: double longitude
}

struct TDate {
	1: string date; // standard date time with UTC
}

struct TTime {
	1: string time; // standard time with UTC
}

struct TInventory {
  1: double inventory;	// 0 - not available, 1+  Available with that quantity, Infinity - Available Infinitly.
}

struct TMealPlan {
	1: string id;
	2: string name;
}

struct TCommonValues {
  1: string id;
  2: string name;
  3: string type;
  4: TDate activationDate;
  5: TDate expiryDate;
  6: TPrice price;
  7: TInventory inventory;
}

struct TAddress {
  1: string addressCity;
  2: string addressState;
  3: string addressCountry;
  4: string addressPinCode;
}

struct THotel {
  1: TCommonValues commonValues;
  2: TAddress address;
  3: TMapLocation mapLocation;
  4: string hotelCategory;
  5: list<string> roomCategories;
  6: TMealPlan mealPlan; //TODO Not sure it's a object or not
  7: list<string> restrictions; //TODO
  8: TTime checkInTime;
  9: TTime checkOutTime;
  10: string paymentPolicy;
  11: string cancellationPolicy;
}

struct TPackageWithFewDetails {
  1: TCommonValues commonValues;
  2: TDestination destination;
  3: i32 numberOfNights;
}

struct TPackageWithStandardDetails {
	1: TCommonValues commonValues;
  2: TDestination destination;
  3: list<string> tags;
  4: list<TCity> legsIncluded;
  5: i32 numberOfNights;
  6: list<string> inclusions;
  7: list<string> availableMonths;
}

struct TPackageWithCompleteDetails {
	1: TCommonValues commonValues;
  2: TDestination destination;
  3: list<string> tags;
  4: list<TCity> legsIncluded;
  5: i32 numberOfNights;
  6: list<string> inclusions;
  7: list<string> exclusions;
  8: list<string> restrictions;
  9: list<string> availableMonths;
  10: list<THotel> hotels;
  11: string paymentPolicy;
  12: string cancellationPolicy;
}

struct TPackageDetailedResponse {
	1: TPackageWithCompleteDetails packageDetails;
 	2: TStatus status;
 	3: map<string,string> errorList;
}

struct TPackageStandardResponse {
	1: TPackageWithStandardDetails packageDetails;
	2: TStatus status;
	3: map<string,string> errorList;
}

struct TPackageSmallResponse {
	1: TPackageWithFewDetails packageDetails;
	2: TStatus status;
	3: map<string,string> errorList;
}

struct TSearchAndFilterAttributes {
	1: string destinationId;
	2: list<string> durationIds; // 2-4 days, etc, currently filter might not be applicable
	3: list<string> selectedMonthIds;
}
// NOTE: check versioning
service TPackageAggregationService {

  TPackageDetailedResponse getPackageDetails(1:string catalogId, 2:TSearchAndFilterAttributes userSelectedAttributes);

  list<TPackageSmallResponse> getPackageListingWithFewDetails(1: list<string> catalogIds, 2:TSearchAndFilterAttributes userSelectedAttributes);

  list<TPackageStandardResponse> getPackageListingWithStandardDetails(1: list<string> catalogIds, 2:TSearchAndFilterAttributes userSelectedAttributes);

}