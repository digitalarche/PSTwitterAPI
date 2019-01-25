function Get-TwitterUsers_Lookup {

<#
.SYNOPSIS
    Follow, search, and get users

.DESCRIPTION
    GET users/lookup
    
    Returns fully-hydrated user objects for up to 100 users per request, as specified by comma-separated values passed to the user_id and/or screen_name parameters.
    
    This method is especially useful when used in conjunction with collections of user IDs returned from GET friends / ids and GET followers / ids.
    
    GET users / show is used to retrieve a single user object.
    
    There are a few things to note when using this method.
    
    You must be following a protected user to be able to see their most recent status update. If you don't follow a protected user their status will be removed.
    The order of user IDs or screen names may not match the order of users in the returned array.
    If a requested user is unknown, suspended, or deleted, then that user will not be returned in the results list.
    If none of your lookup criteria can be satisfied by returning a user object, a HTTP 404 will be thrown.
    You are strongly encouraged to use a POST for larger requests.

.PARAMETER screen_name
    A comma separated list of screen names, up to 100 are allowed in a single request. You are strongly encouraged to use a POST for larger (up to 100 screen names) requests.

.PARAMETER user_id
    A comma separated list of user IDs, up to 100 are allowed in a single request. You are strongly encouraged to use a POST for larger requests.

.PARAMETER include_entities
    The entities node that may appear within embedded statuses will not be included when set to false.

.PARAMETER tweet_mode
    Valid request values are compat and extended, which give compatibility mode and extended mode, respectively for Tweets that contain over 140 characters

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-users-lookup

#>
    [CmdletBinding()]
    Param(
        [string]$screen_name,
        [string]$user_id,
        [string]$include_entities,
        [string]$tweet_mode
    )
    Begin {

        [string]$Method      = 'GET'
        [string]$Resource    = '/users/lookup'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/users/lookup.json'

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | % { $Parameters.Remove($_) }

    }
    Process {

        If (-Not $OAuthSettings) { $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource }
        Invoke-TwitterAPI -Resource $Resource -Method $Method -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}