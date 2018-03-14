namespace java com.oyo.search

enum TStatus {
	SUCCESS,
	FAILURE
}

struct TSearchParameters {
	1: string destination,
	2: list<string> durations,
  	3: list<i32> months
}

struct TSearchResponse {
	1: list<string> catalog_ids,
	2: TStatus status ,
  	3: map<string, string> errorList
}

service TSearchService{

    TSearchResponse getSearchResults(1: TSearchParameters tSearchParameters);

}
