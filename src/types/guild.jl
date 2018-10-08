@enum VerificationLevel VERIFICATION_NONE VERIFICATION_LOW VERIFICATION_MEDIUM VERIFICATION_HIGH VERIFICATION_VERY_HIGH
@enum MessageNotificationLevel ALL_MESSAGES ONLY_MENTIONS
@enum ExplicitContentFilterLevel DISABLED MEMBERS_WITHOUT_ROLES ALL_MEMBERS
@enum MFALevel MFA_NONE MFA_ELEVATED

abstract type AbstractGuild end

AbstractGuild(d::Dict) = d["unavailable"] === true ? UnavailableGuild(d) : Guild(d)

"""
An unavailable guild (server).
More details [here](https://discordapp.com/developers/docs/resources/guild#unavailable-guild-object).
"""
@from_dict struct UnavailableGuild <: AbstractGuild
    id::Snowflake
    unavailable::Bool
end

"""
A guild (server).
More details [here](https://discordapp.com/developers/docs/resources/guild#guild-object).
"""
@from_dict struct Guild <: AbstractGuild
    id::Snowflake
    name::String
    icon::Union{String, Missing}
    splash::Union{String, Missing}
    owner::Union{Bool, Nothing}
    owner_id::Snowflake
    permissions::Union{Int, Nothing}
    region::String
    afk_channel_id::Union{Snowflake, Missing}
    afk_timeout::Int
    embed_enabled::Union{Bool, Nothing}
    embed_channel_id::Union{Snowflake, Nothing}
    verification_level::VerificationLevel
    default_message_notifications::MessageNotificationLevel
    explicit_content_filter::ExplicitContentFilterLevel
    roles::Vector{Role}
    emojies::Vector{Emoji}
    features::Vector{String}
    mfa_level::MFALevel
    application_id::Union{Snowflake, Missing}
    widget_enabled::Union{Bool, Nothing}
    widget_channel_id::Union{Snowflake, Nothing}
    system_channel_id::Union{Snowflake, Missing}
    joined_at::Union{DateTime, Nothing}
    large::Union{Bool, Nothing}
    unavailable::Union{Bool, Nothing}
    member_count::Union{Int, Nothing}
    voice_states::Union{Vector{VoiceState}, Nothing}
    members::Union{Vector{GuildMember}, Nothing}
    channels::Union{Vector{Channel}, Nothing}
    presences::Union{Vector{Presence}, Nothing}
end
