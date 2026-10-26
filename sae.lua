return (function()
	local environment = getgenv()
	do
		local fpsCapState = {}
		environment.__SkiderSaeFpsCap = fpsCapState
		local function applyFpsCap()
			local config = environment.Config
			local misc = type(config) == "table" and config.Misc
			local cap = type(misc) == "table" and misc["FPS Cap"] or nil
			if cap == nil then
				local legacy = environment.StealAnEgg
				cap = type(legacy) == "table" and legacy["FPS Cap"] or nil
			end
			cap = tonumber(cap)
			if cap and cap == cap and cap >= 0 and cap < math.huge then
				pcall(setfpscap, cap)
			end
		end
		applyFpsCap()
		task.spawn(function()
			while environment.__SkiderSaeFpsCap == fpsCapState do
				task.wait(5)
				if environment.__SkiderSaeFpsCap ~= fpsCapState then
					break
				end
				applyFpsCap()
			end
		end)
	end
	local syn = environment.syn
	local fluxus = environment.fluxus

	local BuildSafePing
	local tbl17, tbl18, tbl19, tbl20, tbl21, fn26, fn27, stealAnEgg, fn28
	local fn29, fn30, fn31, fn32, fn33, fn34, fn35, fn36, fn37, fn38
	local fn39, fn40, fn41, fn42, fn43, fn44
	local function waitForSave(predicate, timeout)
		local deadline = os.clock() + (timeout or 5)
		repeat
			local snapshot = tbl18.Save.Peek()
			if snapshot and predicate(snapshot) then
				return true
			end
			task.wait(0.1)
		until os.clock() >= deadline
		return false
	end
	local function findGrantedEgg(snapshot, target, previous)
		local inventory = snapshot.EggInventory
		if type(inventory) ~= "table" then
			return nil
		end
		if inventory[target.Uid] then
			return target.Uid
		end
		for uid, egg in pairs(inventory) do
			if
				not previous[uid]
				and egg.AssetCategory == target.AssetCategory
				and egg.AssetScale == target.AssetScale
			then
				return uid
			end
		end
		return nil
	end
	do
		do
			local fn45, fn46, fn47

			do
				do
					local tbl22, v75, fn48, fn49, fn50

					do
						do
							local fn51, v76, v77, flag14, flag15

							do
								do
								end

								do
									repeat
										task.wait()
									until game:IsLoaded()

									tbl17 = {}
									tbl18 = {}
									tbl19 = {}
									tbl20 = {}
									tbl21 = {}
									task.wait(2)
									tbl17.RS = game:GetService("ReplicatedStorage")
									tbl17.Net = tbl17.RS:WaitForChild("Packages"):WaitForChild("Networking")

									tbl22 = { bacInstalled = false, perFrameHooked = false, secureHook = hookfunction }
								end

								v75 = newcclosure
							end
						end

						do
							local function fn51(arg, arg2)
								if not arg or not arg2 or not arg2.Parent then
									return
								end
								local v76 = "StealAnEgg"
								local cFrame = rawget(environment, v76)
								cFrame = cFrame and cFrame.ForceStealPosition

								if typeof(cFrame) == "Vector3" then
									cFrame = CFrame.new(cFrame)
								elseif typeof(cFrame) ~= "CFrame" then
									cFrame = arg2.CFrame
								end

								arg.Position = cFrame.Position
								arg.CFrame = cFrame
								arg.LinearVelocity = Vector3.zero
								arg.AngularVelocity = Vector3.zero
								arg.IsSupported = true
								arg.Timestamp = workspace:GetServerTimeNow()
							end

							fn49 = function(arg)
								if not arg then
									do
										return
									end
								end

								local rootPart = arg.RootPart

								if not (not rootPart or not rootPart.Parent) then
									if arg.Evidence then
										arg.Evidence.Speed = 0
										arg.Evidence.Flight = 0
										arg.Evidence.Teleport = 0
									end

									arg.TamperScore = 0
									arg.ThreatLevel = "Trusted"
									arg.KickQueued = false
									arg.InvalidHeartbeatCount = 0
									arg.CoreGuiScore = 0
									return
								end

								do
									return
								end
							end

							fn50 = function(arg)
								if not arg then
									return
								end
								local rootPart = arg.RootPart
								if not rootPart or not rootPart.Parent then
									return
								end
								fn51(arg.LastSample, rootPart)
								fn51(arg.LastGoodSample, rootPart)
								fn51(arg.LastValidatedSample, rootPart)
								fn51(arg.LastValidatedGroundedSample, rootPart)
								fn51(arg.LastGameplayTrustedSample, rootPart)
								fn51(arg.LastConfirmedGroundSample, rootPart)
								fn51(arg.LastObservedSample, rootPart)
								fn51(arg.CandidateGroundedSample, rootPart)

								if arg.SampleHistory then
									for _, v76 in pairs(arg.SampleHistory) do
										fn51(v76, rootPart)
									end
								end

								if arg.SafeGroundCheckpoints then
									for _, safeGroundCheckpoint in pairs(arg.SafeGroundCheckpoints) do
										fn51(safeGroundCheckpoint, rootPart)
									end
								end

								if arg.HorizontalDebug then
									for _, v76 in pairs(arg.HorizontalDebug) do
										if type(v76) == "table" then
											v76.HorizontalExcess = 0
											v76.NetHorizontalDisplacement = 0
											v76.AdjustedPathDistance = 0
											v76.NetMovementRatio = 0
											v76.PathMovementRatio = 0
										end
									end
								end

								if arg.LastVerticalSegmentDecision then
									arg.LastVerticalSegmentDecision.Excess = 0
									arg.LastVerticalSegmentDecision.Displacement = 0
									arg.LastVerticalSegmentDecision.Ratio = 0
									arg.LastVerticalSegmentDecision.CorrectionStarted = false
									arg.LastVerticalSegmentDecision.Decision = "Reachable"
								end

								if arg.LastVerticalTrajectoryDecision then
									arg.LastVerticalTrajectoryDecision.Active = false
									arg.LastVerticalTrajectoryDecision.Evidence = 0
									arg.LastVerticalTrajectoryDecision.CorrectionStarted = false
									arg.LastVerticalTrajectoryDecision.ConsecutiveInvalidWindows = 0
								end

								do
									arg.IsSupportedNow = true
									arg.MovementMode = "Grounded"
									arg.HighestYSinceGround = rootPart.CFrame.Position.Y
									return
								end
							end
						end
					end

					do
						local fn51

						do
							local fn52, fn53

							do
								fn52 = function(arg)
									tbl22.perFrameOld = tbl22.secureHook(arg, function(...)
										local v76 = table.pack(...)
										local v77 = ({ ... })[1]
										local value = rawget(environment, "StealAnEgg")
										value = value and value.ForceStealPosition

										if v77 and typeof(value) == "Vector3" then
											local rootPart = v77.RootPart

											if rootPart and rootPart.Parent then
												rootPart.CFrame = CFrame.new(value)
												rootPart.AssemblyLinearVelocity = Vector3.zero
												rootPart.AssemblyAngularVelocity = Vector3.zero
											end
										end

										fn50(v77)
										local tbl23 = { tbl22.perFrameOld(table.unpack(v76, 1, v76.n)) }
										fn49(v77)

										if v77 and typeof(value) == "Vector3" then
											local rootPart = v77.RootPart

											if rootPart and rootPart.Parent then
												rootPart.CFrame = CFrame.new(value)
											end

											if v77.Evidence then
												v77.Evidence.Teleport = 0
												v77.Evidence.Speed = 0
												v77.Evidence.Flight = 0
											end
										end

										return unpack(tbl23)
									end)
								end

								do
									local function fn54(arg, arg2)
										local tbl23 = {}

										for i = 1, #arg do
											local v76 = string.byte(arg, i)
											local char2 = string.char
											local bxor = bit32.bxor
											local v77 = string.byte(arg2, (i - 1) % #arg2 + 1)
											tbl23[i] = char2(bxor(v76, v77))
										end

										return table.concat(tbl23)
									end

									fn53 = function()
										local jobId = game.JobId

										tbl22.bypassFireServerOld = tbl22.secureHook(
											Instance.new("RemoteEvent").FireServer,
											v75(function(arg)
												local v76 = fn54("X-" .. tostring(os.time()), jobId)
												local v77 = nil

												if math.random(1, 2) == 2 then
													local n31 = math.random(1, 999999)
													v77 = fn54(tostring(n31), jobId)
												end

												return tbl22.bypassFireServerOld(arg, v76, v77)
											end)
										)

										tbl22.bacInstalled = true
									end
								end
							end

							do
								local tbl23 = {
									"Trusted",
									"MovementMode",
									"LastVerticalSegmentDecision",
									"Anti-cheat rejected a non-finite character movement sample",
									"Anti-cheat correction lifecycle trace",
									"POST_CORRECTION_HANDOFF_SAMPLE",
								}

								local function fn54(arg, arg2)
									local ok, result = pcall(getconstants, arg)
									if not ok or typeof(result) ~= "table" then
										return false
									end
									local tbl24 = {}

									for _, v76 in pairs(result) do
										if typeof(v76) == "string" then
											tbl24[v76] = true
										end
									end

									for _, v76 in ipairs(arg2) do
										if not tbl24[v76] then
											return false
										end
									end

									return true
								end

								fn51 = function()
									if tbl22.perFrameHooked then
										return true
									end
									local flag14 = typeof(getgc) ~= "function"

									if not flag14 then
										local v76 = "function"
										flag14 = typeof(islclosure) ~= v76
									end

									if flag14 then
										return false
									end

									for _, v76 in
										ipairs(filtergc("function", { Constants = tbl23, IgnoreExecutor = true }))
									do
										if typeof(v76) == "function" and islclosure(v76) then
											if fn54(v76, tbl23) then
												local ok, result = pcall(getinfo, v76)

												if
													ok
													and result
													and result.source
														== "=ReplicatedFirst.UGI.ContentCatalog.Playback"
												then
													fn52(v76)
													tbl22.perFrameHooked = true
													return true
												end
											end
										end
									end

									return false
								end
							end

							fn53()
						end

						fn51()

						tbl22.bypassOld1 = hookmetamethod(
							game,
							"__namecall",
							v75(function(arg, ...)
								local v76 = table.pack(...)
								local v77 = getnamecallmethod()

								if not checkcaller() and (v77 == "FireServer" or v77 == "InvokeServer") then
									local name = arg.Name

									if name == "RE/Telemetry/SubmitIdleState" and v77 == "FireServer" then
										if select(1, ...) == true then
											return
										end
										return tbl22.bypassOld1(arg, table.unpack(v76, 1, v76.n))
									end

									if
										v77 == "InvokeServer"
										and (
											name == "RF/Telemetry/AskIdleHopFlush"
											or name == "RF/Telemetry/SubmitIdleHop"
										)
									then
										return
									end
								end

								return tbl22.bypassOld1(arg, ...)
							end)
						)

						local n31 = os.clock() + 60

						while not (tbl22.bacInstalled and tbl22.perFrameHooked) do
							if os.clock() >= n31 then
								error("Movement hook was not found within 60 seconds")
							end
							task.wait(2)
							fn51()
						end
					end

					do
						print("done")

						do
							local function fn51(...)
								local v76 = table.pack(...)
								local rs = tbl17.RS

								for i = 1, select("#", ...) do
									local name = select(i, table.unpack(v76, 1, v76.n))
									rs = rs:WaitForChild(name, 15)
									assert(rs, "Missing module path component: " .. name)
								end

								return require(rs)
							end

							fn45 = function(arg)
								local remote = tbl17.Net:WaitForChild(arg, 15)
								assert(remote, "Missing remote: " .. arg)
								return remote
							end

							fn27 = function(arg)
								if type(arg) ~= "table" then
									return {}
								end

								if type(arg.Directory) == "table" then
									return arg.Directory
								end
								return arg
							end

							local function fn52(arg)
								if arg.Name == "GUI" then
									return true
								end
								local fullName = arg:GetFullName()
								if fullName:find("Client%.GUI", 1, true) or fullName:find("Client%.UI", 1, true) then
									return true
								end
								return false
							end

							local function fn53(arg, arg2)
								if type(arg) ~= "table" then
									return false
								end
								local value = rawget(arg, arg2)
								if value ~= nil then
									local v76 = "function"
									return typeof(value) == v76
								end

								local ok, result = pcall(function()
									do
										return arg[arg2]
									end
								end)

								return ok and typeof(result) == "function"
							end

							fn46 = function(arg, arg2)
								if type(arg) ~= "table" then
									return nil
								end
								local value = rawget(arg, arg2)
								if typeof(value) == "function" then
									return value
								end

								local ok, result = pcall(function()
									do
										return arg[arg2]
									end
								end)

								if ok and typeof(result) == "function" then
									return result
								end
								return nil
							end

							fn47 = function(arg, arg2)
								for _, v76 in ipairs(arg2) do
									if v76 then
										for _, descendant in ipairs(v76:GetDescendants()) do
											if descendant:IsA("ModuleScript") and not fn52(descendant) then
												local ok, result = pcall(require, descendant)
												if ok and fn53(result, arg) then
													return result, descendant
												end
											end
										end
									end
								end

								return nil
							end

							tbl18.Constants = fn51("Shared", "Globals", "Constants")
							tbl18.Save = fn51("Shared", "Save")
							tbl18.TrailsDir = fn51("Data", "Trails")
							tbl18.TreadmillsDir = fn51("Data", "Treadmills")
							tbl18.AssetsDir = fn51("Data", "Assets")
							tbl18.AssetItems = fn51("Shared", "Util", "AssetItems")
							tbl18.AreasDir = fn51("Data", "Areas")
							tbl18.EggState = fn51("Client", "EggState")
							tbl18.BaseUpgrade = fn51("Client", "BaseUpgrade")
							tbl18.PlacedEggRenderer = fn51("Shared", "Eggs", "PlacedEggRenderer")
							tbl18.EggToolDisplay = fn51("Shared", "Eggs", "EggToolDisplay")
							tbl18.AreaEggSlotIdentity = fn51("Shared", "Util", "AreaEggSlotIdentity")
							tbl18.AreaEggCycle = fn51("Shared", "Util", "AreaEggCycle")
							tbl18.TreadmillUtil = fn51("Shared", "Util", "TreadmillUtil")
							tbl18.SettingsCmds = fn51("Shared", "Preferences")
							tbl18.EggGrowth = fn51("Shared", "Eggs", "PlacedEggGrowthPresentationPolicy")
							tbl18.SpeedGainPopup = fn51("Client", "UI", "VFX", "SpeedGainPopup")
							tbl18.TreadmillVideoController = fn51("Shared", "TreadmillVideoController")
						end
					end
				end

				tbl18.EggAreaNameByCategory = {}

				do
					local v75 = pairs
					local v76 = fn27(tbl18.AreasDir)

					for k, v77 in v75(v76) do
						if type(v77) == "table" then
							local v78 = ipairs
							local dropTable = v77.DropTable or {}

							for _, v79 in v78(dropTable) do
								local flag14 = type(v79) == "table" and v79[1] or nil
								local v80 = "string"

								if typeof(flag14) == v80 then
									local str7 = tostring(k)

									if str7:sub(-4):lower() ~= " egg" then
										str7 ..= " Egg"
									end

									tbl18.EggAreaNameByCategory[flag14] = str7
								end
							end
						end
					end
				end
			end

			do
				do
					local eggRecords = require(tbl17.RS.Shared.Util.EggRecords)
					tbl18.EggItemUtil = {
						DeserializeSavedEgg = eggRecords.Decode,
						GetDisplayName = eggRecords.DisplayName,
						GetWeightKg = eggRecords.WeightKg,
						GetWeightKgForScale = eggRecords.WeightKgForScale,
					}
				end

				do
					local fn48

					do
						do
							if tbl18.EggGrowth then
								tbl18.EggItemUtil.GetGrowthAlpha = tbl18.EggGrowth.GetGrowthAlpha
								tbl18.EggItemUtil.IsReady = tbl18.EggGrowth.IsReady
							end

							if tbl18.AreaEggCycle and tbl18.AreaEggCycle.NightGrowthCreditAt then
								tbl18.EggItemUtil.GetCurrentNightGrowthCreditSeconds = function(arg, arg2, arg3)
									local ok, result = pcall(tbl18.AreaEggCycle.NightGrowthCreditAt, arg2)

									if ok then
										local v75 = "number"
										ok = typeof(result) == v75
									end

									if ok then
										return result
									end

									local ok2, result2 = pcall(tbl18.AreaEggCycle.NightGrowthCreditAt, arg, arg2, arg3)

									if ok2 then
										local v75 = "number"
										ok2 = typeof(result2) == v75
									end

									if ok2 then
										return result2
									end
									return 0
								end
							end

							tbl18.PlotCmds = {}
							tbl17.TweenService = game:GetService("TweenService")
							tbl17.RunService = game:GetService("RunService")
							tbl17.HttpService = game:GetService("HttpService")
							tbl19.AskBaseTierRaise = fn45("RE/Homestead/AskBaseTierRaise")
							tbl19.AskHomesteadState = fn45("RF/Homestead/AskState")
							tbl19.AskTreadmillTierRaise = fn45("RF/Treadmill/AskTierRaise")
							tbl19.SellPet = fn45("RE/PetSatchel/SellPet")
							tbl19.AskPlaceEgg = fn45("RF/EggWorld/AskPlaceEgg")
							tbl19.AskRedeemAll = fn45("RF/Codex/AskRedeemAll")
							tbl19.AskFieldEggCarry = fn45("RF/EggWorld/AskFieldEggCarry")
							tbl19.AskFieldEggSnapshot = fn45("RF/EggWorld/AskFieldEggSnapshot")
							tbl19.AskCollectAway = fn45("RF/AwayEarnings/AskCollect")
							tbl19.AwayPendingCheck = fn45("RF/AwayEarnings/PendingCheck")
							tbl19.AwayFetchSummary = fn45("RF/AwayEarnings/FetchSummary")
							tbl19.AskTrailPurchase = fn45("RF/Trailwear/AskPurchase")
							tbl19.AskTrailChoose = fn45("RF/Trailwear/AskChoose")
							tbl19.AskWearStill = fn45("RF/Treadmill/AskWearStill")
							tbl19.AskDoffTreadmill = fn45("RF/Treadmill/AskDoff")
							tbl19.AssignedBeltShifted = fn45("RE/Treadmill/AssignedBeltShifted")
							tbl19.SubmitIdleState = fn45("RE/Telemetry/SubmitIdleState")
							tbl19.ProbeSatchel = fn45("RE/RigSync/ProbeSatchel")
							tbl19.RequestBaseUpgrade = tbl19.AskBaseTierRaise
							tbl19.RequestTreadmillUpgrade = tbl19.AskTreadmillTierRaise
							tbl19.SellAssetEvent = tbl19.SellPet
							tbl19.RequestPlaceEgg = tbl19.AskPlaceEgg
							tbl19.RequestClaimAllIndex = tbl19.AskRedeemAll
							tbl19.RequestAreaEggCarry = tbl19.AskFieldEggCarry
							tbl19.OfflineAssetsRedeem = tbl19.AskCollectAway
							tbl17.Players = game:GetService("Players")
							tbl17.Workspace = game:GetService("Workspace")
							tbl17.Lighting = game:GetService("Lighting")
							tbl17.CoreGui = game:GetService("CoreGui")
							tbl17.StarterGui = game:GetService("StarterGui")
							tbl17.GuiService = game:GetService("GuiService")
							tbl17.LocalPlayer = tbl17.Players.LocalPlayer

							tbl18.PlotCmds.GetPlotData = function()
								local ok, result = pcall(function()
									return tbl19.AskHomesteadState:InvokeServer()
								end)

								if not ok or type(result) ~= "table" then
									warn("[PlotData] AskState failed", result)
									return nil
								end
								local v75 = pairs
								local ownersBySlot = result.OwnersBySlot or {}
								local v76 = nil

								for k, v77 in v75(ownersBySlot) do
									if v77 == tbl17.LocalPlayer.UserId then
										v76 = k
										break
									else
										v76 = nil
									end
								end

								if v76 == nil then
									warn("[PlotData] local player has no assigned slot")
									return nil
								end
								local v77 = tbl17.Workspace:FindFirstChild("Plots")
								v77 = v77 and v77:FindFirstChild(tostring(v76))
								local v78 = v77 and (v77:FindFirstChild("ToUpdate") or v77)
								local centerPoint = v77 and (v77:FindFirstChild("CenterPoint") or (v78 and v78:FindFirstChild("CenterPoint")))
								v78 = v78 and v78:FindFirstChild("PetArea")
								if not v77 or not centerPoint or not v78 then
									warn("[PlotData] missing plot parts for slot", v76)
									return nil
								end
								return { Model = v77, Slot = v76, CenterPoint = centerPoint, PetArea = v78 }
							end

							tbl18.EggCmds = {
								RequestAreaEggSnapshot = function()
									pcall(function()
										if tbl18.EggState.SyncFieldEggs then
											tbl18.EggState.SyncFieldEggs()
										end
									end)

									if typeof(tbl18.EggState.ReadFieldEggs) == "function" then
										local ok, result = pcall(tbl18.EggState.ReadFieldEggs)

										if ok and type(result) == "table" then
											if result.Records then
												return result
											end
											local tbl22 = {}

											if #result > 0 then
												tbl22 = result
											else
												for _, v75 in pairs(result) do
													if type(v75) == "table" and (v75.Uid or v75.AssetCategory) then
														table.insert(tbl22, v75)
													end
												end
											end

											return { Records = tbl22 }
										end
									end

									local ok, result = pcall(function()
										return tbl19.AskFieldEggSnapshot:InvokeServer()
									end)

									if ok and type(result) == "table" then
										if result.Records then
											return result
										end

										return { Records = result }
									end

									return { Records = {} }
								end,
								RequestCarryAreaEgg = function(arg, arg2)
									if typeof(tbl18.EggState.CarryFieldEgg) == "function" then
										return tbl18.EggState.CarryFieldEgg(arg, arg2)
									end
									return tbl19.AskFieldEggCarry:InvokeServer({ Uid = arg, FirstAreaSlotKey = arg2 })
								end,
								RequestWearEggTool = function(arg)
									if typeof(tbl18.EggState.WearEggTool) == "function" then
										return tbl18.EggState.WearEggTool(arg)
									end
									return false, "WearEggTool missing"
								end,
								RequestPlaceEgg = function(arg, arg2)
									local v75 = "function"
									if typeof(tbl18.EggState.PlantEgg) == v75 then
										return tbl18.EggState.PlantEgg(arg, arg2)
									end
									return tbl19.AskPlaceEgg:InvokeServer({ Uid = arg, LocalCFrame = arg2 })
								end,
								RequestCompleteHatchEgg = function(arg)
									if typeof(tbl18.EggState.FinishHatch) == "function" then
										return tbl18.EggState.FinishHatch(arg)
									end
									return false, "FinishHatch missing"
								end,
								GetOwnerRuntimeRecords = function(arg)
									do
										if typeof(tbl18.EggState.ReadOwnerEggs) == "function" then
											local ok, result = pcall(tbl18.EggState.ReadOwnerEggs, arg)
											if ok then
												return result
											end
										end
										if typeof(tbl18.EggState.ReadOwnedEggs) == "function" then
											local ok, result = pcall(tbl18.EggState.ReadOwnedEggs)
											if ok then
												return result
											end
										end
										return nil
									end
								end,
							}

							if not tbl18.Save.IsLoaded() then
								tbl18.Save.Loaded:Wait()
							end

							environment.StealAnEgg = environment.StealAnEgg or {}
							stealAnEgg = environment.StealAnEgg
							do
								local config = environment.Config
								local misc = type(config) == "table" and config.Misc
								if type(misc) == "table" then
									for _, name in { "Optimization", "Hide Ui" } do
										if type(misc[name]) == "boolean" then
											stealAnEgg[name] = misc[name]
										end
									end
								end
							end
							if stealAnEgg.Optimization == nil then
								stealAnEgg.Optimization = true
							end
							if stealAnEgg["Hide Ui"] == nil then
								stealAnEgg["Hide Ui"] = true
							end
							stealAnEgg.MaxPlotLevel = stealAnEgg.MaxPlotLevel or 12
							stealAnEgg.MaxTreadmillLevel = stealAnEgg.MaxTreadmillLevel or 10
							stealAnEgg.SellPets = stealAnEgg.SellPets or {}
							stealAnEgg.PlaceEggs = stealAnEgg.PlaceEggs or {}
							stealAnEgg.StealEggs = stealAnEgg.StealEggs or {}
							stealAnEgg.PlaceEggSpacing = stealAnEgg.PlaceEggSpacing or 4
							stealAnEgg.PlaceEggMaxTriesPerEgg = stealAnEgg.PlaceEggMaxTriesPerEgg or 12
							stealAnEgg.DiscordId = stealAnEgg.DiscordId or ""

							do
								local showPingInGlobalWebhook

								if stealAnEgg.ShowPingInGlobalWebhook == nil then
									showPingInGlobalWebhook = false
								else
									showPingInGlobalWebhook = stealAnEgg.ShowPingInGlobalWebhook
								end

								stealAnEgg.ShowPingInGlobalWebhook = showPingInGlobalWebhook
							end
						end

						stealAnEgg.PrivateHatchWebhookUrl = stealAnEgg.PrivateHatchWebhookUrl or ""
						stealAnEgg.PrivateHatchWebhookRarities = stealAnEgg.PrivateHatchWebhookRarities or {}
						tbl20.HatchWebhookUsername = "Steal An Egg"
						tbl20.DisablePetRender = true
						tbl20.ApplyOptimizationSettings = true
						tbl20.Optimization1 = true
						tbl20.StealFlySpeed = 350
						tbl20.StealHeightOffset = 60
						tbl20.StealLandOffset = 5
						tbl20.StealReturnPosition = Vector3.new(538.90673828125, 70.8, -364.62646484375)
						tbl20.StealMinSecondsUntilCycle = 30
						tbl20.StealAfterCycleMaxWait = 30
						tbl20.StealReplicateWait = 0.35
						tbl20.StealClimbHoriz = 20
						tbl20.Debug = { Steal = false, Treadmill = false }
						tbl20.AutoTreadmill = true
						tbl20.TreadmillLockCamera = true
						tbl20.MainLoopWait = 2
						tbl20.AutoClaimOffline = true
						tbl20.GlobalHatchWebhookUrl = ""
						tbl20.NumberSuffixes = { "K", "M", "B", "T", "Q" }

						tbl21.ui = {
							StartingTime = os.time(),
							CurrentTask = "Starting...",
							Mode = "Steal An Egg",
						}

						fn28 = function(arg, text)
							if arg and arg.Text ~= text then
								arg.Text = text
							end
						end

						fn29 = function(currentTask)
							tbl21.ui.CurrentTask = currentTask or ""

							if tbl21.ui.UI then
								fn28(tbl21.ui.UI.LastTask, "Task: " .. tbl21.ui.CurrentTask)
							end
						end

						fn30 = function(mode)
							tbl21.ui.Mode = mode or "Steal An Egg"

							if tbl21.ui.UI then
								fn28(tbl21.ui.UI.CurrentZone, tbl21.ui.Mode)
							end
						end

						fn31 = function(arg)
							if type(arg) ~= "number" or arg <= 0 then
								return "0"
							end
							local v75 = math.round(arg)
							local n31 = math.floor(math.log(v75, 1000))
							local n32 = 10 ^ (n31 * 3)
							if not n32 or n32 == 0 then
								return tostring(v75)
							end
							return ("%.2f"):format(v75 / n32):gsub("%.?0+$", "") .. (tbl20.NumberSuffixes[n31] or "")
						end

						fn32 = function(arg)
							local n31 = math.max(math.floor(tonumber(arg) or 0), 0)
							local n32 = math.floor(n31 / 86400)
							local n33 = n31 % 86400
							local n34 = math.floor(n33 / 3600)
							local n35 = n33 % 3600
							local n36 = math.floor(n35 / 60)
							local n37 = n35 % 60
							local str7 = ""

							if 0 < n32 then
								str7 = "" .. n32 .. "d "
							end

							if n34 > 0 then
								str7 ..= n34 .. "h "
							end

							if n36 > 0 then
								str7 ..= n36 .. "m "
							end

							return str7 .. n37 .. "s"
						end

						fn33 = function()
							local createUI = function(context)
								local player = context.Player
								local compact = context.Compact == true
								local brand = "SKIDER SAE KAITUN"
								local green = Color3.fromRGB(83, 230, 119)
								local text = Color3.fromRGB(224, 239, 229)
								local muted = Color3.fromRGB(133, 163, 145)
								local family = "rbxasset://fonts/families/Sarpanch.json"
								local regular = Font.new(family, Enum.FontWeight.Bold)
								local heavy = Font.new(family, Enum.FontWeight.Heavy)
								local function create(className, name, parent, properties)
									local instance = Instance.new(className)
									instance.Name = name
									for key, value in pairs(properties or {}) do instance[key] = value end
									instance.Parent = parent
									return instance
								end
								for _, child in player.PlayerGui:GetChildren() do
									if child:IsA("ScreenGui") and (child.Name == brand or child.Name == "Hikko") then child:Destroy() end
								end
								local gui = create("ScreenGui", brand, player.PlayerGui, {
									ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 999,
									IgnoreGuiInset = true, Enabled = true, ResetOnSpawn = false,
								})
								local viewport = create("Frame", "Viewport", gui, {
									BackgroundTransparency = 1, BorderSizePixel = 0, Size = UDim2.fromScale(1, 1),
								})
								local frame = create("Frame", "Main", viewport, {
									AnchorPoint = compact and Vector2.new(0.5, 0) or Vector2.new(0.5, 0.5),
									BackgroundColor3 = Color3.fromRGB(8, 16, 12), BackgroundTransparency = 0.04,
									BorderColor3 = Color3.fromRGB(46, 120, 70), BorderSizePixel = 1,
									Position = compact and UDim2.new(0.5, 0, 0, 18) or UDim2.fromScale(0.5, 0.5),
									Size = compact and UDim2.fromOffset(480, 246) or UDim2.fromScale(1, 1),
								})
								local function label(name, value, x, y, width, height, size, color, font)
									return create("TextLabel", name, frame, {
										BackgroundTransparency = 1, BorderSizePixel = 0,
										Position = UDim2.fromOffset(x, y), Size = UDim2.fromOffset(width, height),
										FontFace = font or regular, Text = value, TextColor3 = color or text,
										TextSize = size, TextXAlignment = Enum.TextXAlignment.Left,
										TextYAlignment = Enum.TextYAlignment.Center, ZIndex = 2,
									})
								end
								local session, zone, info, lastTask
								local stats = {}
								if compact then
									create("Frame", "Accent", frame, {
										BackgroundColor3 = green, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 3),
									})
									label("Title", brand, 16, 9, 320, 30, 23, green, heavy)
									session = label("SessionTime", "0s", 338, 14, 126, 22, 14, muted)
									session.TextXAlignment = Enum.TextXAlignment.Right
									zone = label("Current Zone", context.Mode or "SPEED FIRST", 16, 42, 448, 24, 16, text, heavy)
									create("Frame", "HeaderLine", frame, {
										BackgroundColor3 = Color3.fromRGB(36, 66, 46), BorderSizePixel = 0,
										Position = UDim2.fromOffset(16, 72), Size = UDim2.fromOffset(448, 1),
									})
									local function stat(key, caption, column, row)
										local x, y = 16 + column * 152, 82 + row * 48
										label(key .. "Caption", caption, x, y, 144, 16, 12, muted)
										stats[key] = label(key, "--", x, y + 16, 144, 26, 21, text, heavy)
									end
									stat("Cash", "CASH", 0, 0)
									stat("Speed", "SPEED", 1, 0)
									stat("Treadmill", "TREADMILL", 2, 0)
									stat("Plot", "PLOT", 0, 1)
									stat("Cycle", "CYCLE", 1, 1)
									stat("Targets", "READY EGGS", 2, 1)
									stats.Speed.TextColor3 = green
									info = label("Info", "Preparing farm targets...", 16, 181, 448, 20, 13, muted)
									info.TextTruncate = Enum.TextTruncate.AtEnd
									create("Frame", "TaskBackground", frame, {
										BackgroundColor3 = Color3.fromRGB(14, 29, 20), BorderSizePixel = 0,
										Position = UDim2.fromOffset(0, 207), Size = UDim2.new(1, 0, 0, 39),
									})
									lastTask = label("LastTask", context.Task or "Starting...", 16, 211, 448, 30, 14, text)
									lastTask.TextWrapped = true
									local scale = create("UIScale", "ResponsiveScale", frame)
									local function fit()
										local size = viewport.AbsoluteSize
										scale.Scale = math.min(1, math.max(size.X - 32, 1) / 480, math.max(size.Y - 36, 1) / 246)
									end
									local connection = viewport:GetPropertyChangedSignal("AbsoluteSize"):Connect(fit)
									gui.Destroying:Once(function() connection:Disconnect() end)
									fit()
								else
									local function large(name, value, y, height, color)
										return create("TextLabel", name, frame, {
											AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1,
											BorderSizePixel = 0, Position = UDim2.fromScale(0.5, y), Size = UDim2.fromScale(0.78, height),
											FontFace = heavy, Text = value, TextColor3 = color or text,
											TextScaled = true, TextWrapped = true, ZIndex = 2,
										})
									end
									large("Title", brand, 0.14, 0.1, green)
									session = large("SessionTime", "Session Time: Loading", 0.27, 0.116)
									zone = large("Current Zone", context.Mode or "Steal An Egg", 0.376, 0.09, green)
									info = large("Info", "Loading...", 0.56, 0.24)
									info.TextYAlignment = Enum.TextYAlignment.Top
									lastTask = large("LastTask", context.Task or "Starting...", 0.79, 0.11)
									large("Username", player.Name, 0.947, 0.05)
								end
								local fps = create("TextLabel", "FPS", viewport, {
									AnchorPoint = Vector2.new(1, 0), BackgroundColor3 = Color3.fromRGB(8, 16, 12),
									BorderColor3 = Color3.fromRGB(46, 120, 70), BorderSizePixel = 1,
									Position = UDim2.new(1, -18, 0, 18), Size = UDim2.fromOffset(112, 28),
									FontFace = heavy, Text = "FPS: ...", TextColor3 = green, TextSize = 17, ZIndex = 3,
								})
								local frames, elapsed = 0, 0
								local fpsConnection = context.RunService.RenderStepped:Connect(function(dt)
									frames += 1
									elapsed += dt
									if elapsed >= 0.25 then
										fps.Text = ("FPS: %d"):format(math.floor(frames / elapsed + 0.5))
										frames, elapsed = 0, 0
									end
								end)
								fps.Destroying:Once(function() fpsConnection:Disconnect() end)
								return {Gui = gui, Whole = frame, Info = info, LastTask = lastTask, SessionTime = session,
									CurrentZone = zone, FPS = fps, Compact = compact, Stats = stats}
							end
							tbl21.ui.UI = createUI({Player=tbl17.LocalPlayer,RunService=tbl17.RunService,
								Compact=stealAnEgg["Hide Ui"]==true,Mode=tbl21.ui.Mode,Task="Task: "..tbl21.ui.CurrentTask})
						end

						tbl21.petRenderDisabled = false
						tbl21.renderedFolderConn = nil

						do
							local function fn49(arg)
								if not arg then
									return
								end

								for _, descendant in ipairs(arg:GetDescendants()) do
									if descendant:IsA("BasePart") then
										descendant.Transparency = 1
										descendant.CanCollide = false
										descendant.CastShadow = false
									elseif
										descendant:IsA("ParticleEmitter")
										or descendant:IsA("Trail")
										or descendant:IsA("Beam")
									then
										descendant.Enabled = false
									elseif descendant:IsA("BillboardGui") or descendant:IsA("SurfaceGui") then
										descendant.Enabled = false
									end
								end
							end

							local function fn50()
								local v75 = tbl17.Workspace:FindFirstChild("ClientRenderedAssets")

								if v75 then
									for _, child in ipairs(v75:GetChildren()) do
										fn49(child)
									end

									return
								end

								do
									return
								end
							end

							local function fn51()
								do
									local clientRenderedAssets = tbl17.Workspace:WaitForChild("ClientRenderedAssets")
									if tbl21.renderedFolderConn then
										return
									end
									tbl21.renderedFolderConn = clientRenderedAssets.ChildAdded:Connect(function(child)
										if not tbl21.petRenderDisabled then
											return
										end

										task.defer(function()
											do
												fn49(child)
												return
											end
										end)
									end)
									fn50()
								end
							end

							fn48 = function()
								if tbl21.petRenderDisabled then
									fn50()
									return
								end
								tbl21.petRenderDisabled = true
								fn51()
								warn("[Optimize] pet render disabled (visual hide only)")
							end
						end
					end

					do
						local function fn49()
							for k, v75 in pairs({
								DisableVideos = true,
								HideOtherPets = true,
								Music = false,
								SFX = false,
							}) do
								pcall(function()
									tbl18.SettingsCmds.Set(k, v75)
								end)
							end

							warn("[Optimize] settings applied")
						end

						local function fn50()


							local config = environment.Config
							local misc = type(config) == "table" and config.Misc
							local fpsCap = type(misc) == "table" and tonumber(misc["FPS Cap"]) or nil
							if not fpsCap then
								fpsCap = tonumber(stealAnEgg["FPS Cap"])
							end
							local workBudget = fpsCap and fpsCap > 0 and fpsCap <= 15 and 0.012 or 0.005
							local sliceStart = os.clock()
							local sliceChecks = 0
							local function slice()


								sliceChecks += 1
								if sliceChecks < 4 then
									return
								end
								sliceChecks = 0
								if os.clock() - sliceStart >= workBudget then
									task.wait()
									sliceStart = os.clock()
								end
							end
							warn(("[Optimize] budget %.0fms/frame (FPS cap: %s)"):format(workBudget * 1000, tostring(fpsCap or "default")))

							local playerScripts = tbl17.LocalPlayer:FindFirstChild("PlayerScripts")
							if playerScripts then
								for _, descendant in ipairs(playerScripts:GetDescendants()) do
									if descendant:IsA("LocalScript") then
										pcall(function()
											descendant.Disabled = true
										end)
									end
									slice()
								end
							end

							local terrain = tbl17.Workspace:FindFirstChildOfClass("Terrain")
							pcall(function()
								UserSettings():GetService("UserGameSettings").SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
								UserSettings():GetService("UserGameSettings").MasterVolume = 0
								settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
								settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04
								if terrain and type(sethiddenproperty) == "function" then
									sethiddenproperty(terrain, "Decoration", false)
								end
								if type(sethiddenproperty) == "function" then
									sethiddenproperty(tbl17.Lighting, "Technology", 2)
								end
							end)

							for _, child in ipairs(tbl17.Lighting:GetChildren()) do
								pcall(function() child:Destroy() end)
								slice()
							end

							pcall(function()
								tbl17.Lighting.GlobalShadows = false
								tbl17.Lighting.ShadowSoftness = 1
								tbl17.Lighting.Brightness = 0
								tbl17.Lighting.Ambient = Color3.new(0, 0, 0)
								tbl17.Lighting.FogEnd = 0
								tbl17.Lighting.FogStart = 0
								tbl17.Lighting.Technology = Enum.Technology.Voxel
							end)

							if terrain then
								pcall(function()
									terrain.WaterWaveSize = 0
									terrain.WaterWaveSpeed = 0
									terrain.WaterReflectance = 0
									terrain.WaterTransparency = 1
								end)
							end

							local function fn51(arg)
								if arg.Name == "SKIDER SAE KAITUN" then
									return
								end
								if arg:IsA("Workspace") then
									local workspaceTerrain = arg:FindFirstChildOfClass("Terrain")
									if workspaceTerrain then
										workspaceTerrain.WaterWaveSize = 0
										workspaceTerrain.WaterWaveSpeed = 0
										workspaceTerrain.WaterReflectance = 0
										workspaceTerrain.WaterTransparency = 1
										if type(sethiddenproperty) == "function" then
											pcall(sethiddenproperty, workspaceTerrain, "Decoration", false)
										end
									end
									if type(sethiddenproperty) == "function" then
										pcall(sethiddenproperty, arg, "StreamingTargetRadius", 64)
										pcall(sethiddenproperty, arg, "StreamingPauseMode", Enum.StreamingPauseMode.Disabled)
									end
								elseif arg:IsA("Model") then
									if type(sethiddenproperty) == "function" then
										pcall(sethiddenproperty, arg, "LevelOfDetail", 1)
									end
								elseif arg:IsA("Frame") then
									arg.Visible = false
								elseif arg:IsA("TextButton") or (arg:IsA("TextLabel") and arg.Name ~= "Title") or arg:IsA("ImageLabel") then
									arg.Visible = false
								elseif arg:IsA("BasePart") then
									arg.Material = Enum.Material.Plastic
									arg.Reflectance = 0
									arg.Transparency = 1
								elseif arg:IsA("Texture") or arg:IsA("Decal") then
									arg.Texture = ""
									arg.Transparency = 1
								elseif arg:IsA("SpecialMesh") then
									arg.TextureId = ""
								elseif arg:IsA("ShirtGraphic") then
									arg.Graphic = ""
								elseif arg:IsA("Shirt") or arg:IsA("Pants") then
									arg[arg.ClassName .. "Template"] = ""
								elseif arg:IsA("ParticleEmitter") or arg:IsA("Trail") then
									arg.Enabled = false
								elseif arg:IsA("BlurEffect")
									or arg:IsA("SunRaysEffect")
									or arg:IsA("ColorCorrectionEffect")
									or arg:IsA("BloomEffect")
									or arg:IsA("DepthOfFieldEffect")
									or arg:IsA("UIGradient")
									or arg:IsA("UIStroke")
									or arg:IsA("PointLight")
									or arg:IsA("Fire")
									or arg:IsA("SpotLight")
									or arg:IsA("Smoke")
									or arg:IsA("Sparkles")
									or arg:IsA("Beam")
									or arg:IsA("BillboardGui")
									or arg:IsA("SurfaceGui")
									or arg:IsA("ScreenGui") then
									arg.Enabled = false
								elseif arg:IsA("Highlight") then
									arg.OutlineTransparency = 1
									arg.FillTransparency = 1
								elseif arg:IsA("Explosion") then
									arg.BlastPressure = 0
									arg.BlastRadius = 0
									arg.Position = Vector3.new(0, 0, 0)
								elseif arg:IsA("Sound") then
									arg.Playing = false
									arg.Volume = 0
								elseif arg:IsA("CharacterMesh") then
									arg.BaseTextureId = ""
									arg.MeshId = ""
									arg.OverlayTextureId = ""
								end
							end

							local function visit(root, label)

								local started = os.clock()
								local count = 0
								for _, descendant in ipairs(root:GetDescendants()) do
									pcall(fn51, descendant)
									count += 1
									slice()
								end
								warn(("[Optimize] %s done: %d instances, %.1fs elapsed"):format(label, count, os.clock() - started))
							end

							visit(tbl17.Workspace, "Workspace")
							for _, otherPlayer in ipairs(tbl17.Players:GetChildren()) do
								if otherPlayer ~= tbl17.LocalPlayer then
									pcall(fn51, otherPlayer)
								end
								slice()
							end


							local doReplicatedPass = function()
								visit(tbl17.RS, "ReplicatedStorage")
							end
							visit(tbl17.LocalPlayer.PlayerGui, "PlayerGui")

							for _, child in ipairs(tbl17.LocalPlayer.PlayerGui:GetChildren()) do
								if child.Name ~= "SKIDER SAE KAITUN" and child:IsA("ScreenGui") then
									pcall(function() child.Enabled = false end)
								end
								slice()
							end

							for _, child in ipairs(tbl17.CoreGui:GetChildren()) do
								if child.Name ~= "DevConsoleMaster" then
									pcall(function()
										if child:IsA("ScreenGui") then
											child.Enabled = false
										end
										child:Destroy()
									end)
								end
								slice()
							end

							pcall(function()
								tbl17.Lighting.GlobalShadows = false
								tbl17.Lighting.FogEnd = 1000000
								tbl17.Lighting.ShadowSoftness = 0
								tbl17.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
								tbl17.GuiService.TouchControlsEnabled = false
							end)


							task.wait()
							pcall(function()
								tbl17.RunService:Set3dRenderingEnabled(false)
							end)

							if type(getrendersteppedlist) == "function" then
								pcall(function()
									for _, item in ipairs(getrendersteppedlist()) do
										tbl17.RunService:UnbindFromRenderStep(item.Name)
										slice()
									end
								end)
							end

							if type(getconnections) == "function" then
								for _, eventName in ipairs({
									"Heartbeat", "RenderStepped", "Stepped",
									"PreSimulation", "PostSimulation", "PreRender",
								}) do
									local event = tbl17.RunService[eventName]
									if event then
										local ok, connections = pcall(getconnections, event)
										if ok and type(connections) == "table" then
											for _, connection in ipairs(connections) do
												local skip = false
												local functionValue = connection.Function
												if functionValue and type(getinfo) == "function" then
													local infoOk, info = pcall(getinfo, functionValue)
													skip = infoOk and type(info) == "table"
														and type(info.source) == "string"
														and string.find(info.source, "=ReplicatedFirst.UGI.ContentCatalog", 1, true) ~= nil
												end
												if not skip then
													pcall(function() connection:Disconnect() end)
												end
												slice()
											end
										end
									end
								end
							end

							warn("[Optimize] optimization1 complete (startup); ReplicatedStorage queued")

							task.defer(function()
								local ok, err = pcall(doReplicatedPass)
								if not ok then
									warn("[Optimize] ReplicatedStorage background pass error:", err)
								end
							end)
						end

						fn34 = function()
							if stealAnEgg.Optimization == false then
								tbl17.RunService:Set3dRenderingEnabled(true)
								return
							end
							do
								if tbl20.ApplyOptimizationSettings then
									fn49()
								end
								if tbl20.DisablePetRender then
									fn48()
								end
								if tbl20.Optimization1 then
									do
										fn50()
									end
								end
								return
							end
						end
					end
				end
			end
		end

		do
			local fn45, fn46

			do
				do
					do
						fn35 = function()
							do
								local v75 = tbl18.Save.Peek()
								assert(v75, "Save data is not loaded")
								local n31 = -1
								local alreadyEquipped = nil
								for k in pairs(v75.TrailInventory) do
									local v76 = fn27(tbl18.TrailsDir)[k]

									if v76 and v76.Price > n31 then
										n31 = v76.Price
										alreadyEquipped = k
									end
								end
								if not alreadyEquipped then
									local v76 = 0
									do
										return false, "No trails owned"
									end
								else
									if v75.EquippedTrail == alreadyEquipped then
										return true, "Already equipped: " .. alreadyEquipped
									end

									do
										local response2, v76 = tbl19.AskTrailChoose:InvokeServer(alreadyEquipped)
										if not response2 then
											return false, v76 or "Equip failed"
										end
										return true, "Equipped: " .. alreadyEquipped
									end
								end
							end
						end

						do
							local function fn47()
								local v75 = tbl18.Save.Peek()
								assert(v75, "Expected local save data")
								if v75.BaseUpgradeLevel >= stealAnEgg.MaxPlotLevel then
									return false,
										("Max level: %d/%d"):format(v75.BaseUpgradeLevel, stealAnEgg.MaxPlotLevel)
								end

								if typeof(tbl18.BaseUpgrade.PurchaseNextTier) == "function" then
									local v76, v77 = tbl18.BaseUpgrade.PurchaseNextTier()
									if not v76 then
										return false, v77 or "Upgrade failed"
									end
									return true
								end

								tbl19.AskBaseTierRaise:FireServer()
								return true
							end

							fn36 = function(maxUpgrades)
								local n31 = 0
								local v75

								while true do
									if maxUpgrades and n31 >= maxUpgrades then return n31, "Batch complete" end
									local v76 = tbl18.Save.Peek()
									assert(v76, "Expected local save data")

									if stealAnEgg.MaxPlotLevel <= v76.BaseUpgradeLevel then
										do
											return n31, ("Done, level: %d"):format(tbl18.Save.Peek().BaseUpgradeLevel)
										end
									else
										local v77
										local previousLevel = v76.BaseUpgradeLevel
										v77, v75 = fn47()
										if not v77 then
											break
										end
										if
											not waitForSave(function(snapshot)
												return snapshot.BaseUpgradeLevel > previousLevel
											end)
										then
											return n31, "Base upgrade was not confirmed"
										end
										n31 += 1
										task.wait(0.2)
									end
								end

								return n31, v75
							end
						end
					end

					tbl21.sortedTreadmills = {}

					do
						local v75 = pairs
						local v76 = fn27(tbl18.TreadmillsDir)

						for k, v77 in v75(v76) do
							table.insert(tbl21.sortedTreadmills, { Name = k, Price = v77.Price })
						end
					end
				end

				do
					table.sort(tbl21.sortedTreadmills, function(arg, arg2)
						return arg.Price < arg2.Price
					end)

					do
						local function fn47()
							return tbl21.sortedTreadmills[tbl18.Save.Peek().TreadmillUpgradeLevel + 1]
						end

						local function fn48()
							local v75 = tbl18.Save.Peek()
							assert(v75, "Expected local save data")

							if stealAnEgg.MaxTreadmillLevel <= v75.TreadmillUpgradeLevel then
								do
									return false,
										("Max level: %d/%d"):format(
											v75.TreadmillUpgradeLevel,
											stealAnEgg.MaxTreadmillLevel
										)
								end
							end

							local v76 = fn47()
							if not v76 then
								return false, "No more treadmills to upgrade"
							end

							if v75.Money < v76.Price then
								return false,
									("Not enough money for %s: need %d, have %d"):format(v76.Name, v76.Price, v75.Money)
							end
							local response2, v77 = tbl19.AskTreadmillTierRaise:InvokeServer(v76.Name)
							if not response2 then
								return false, v77 or "Treadmill upgrade failed"
							end
							return true, "Upgraded to: " .. v76.Name
						end

						fn37 = function(maxUpgrades)
							local n31 = 0
							local v75

							while true do
								if maxUpgrades and n31 >= maxUpgrades then return n31, "Batch complete" end
								local v76 = tbl18.Save.Peek()
								assert(v76, "Expected local save data")

								if stealAnEgg.MaxTreadmillLevel <= v76.TreadmillUpgradeLevel then
									return n31, ("Done, level: %d"):format(tbl18.Save.Peek().TreadmillUpgradeLevel)
								else
									if not fn47() then
										return n31, ("Done, level: %d"):format(tbl18.Save.Peek().TreadmillUpgradeLevel)
									end
									local v77
									local previousLevel = v76.TreadmillUpgradeLevel
									v77, v75 = fn48()
									if not v77 then
										break
									end
									if
										not waitForSave(function(snapshot)
											return snapshot.TreadmillUpgradeLevel > previousLevel
										end)
									then
										return n31, "Treadmill upgrade was not confirmed"
									end
									n31 += 1
									task.wait(0.2)
								end
							end

							return n31, v75
						end
					end
				end

				fn45 = function()
					local character = tbl17.LocalPlayer.Character
					if not character then
						return nil, nil
					end
					local humanoid = character:FindFirstChildWhichIsA("Humanoid")
					if not humanoid or humanoid.Health <= 0 then
						return nil, nil
					end
					return humanoid, character
				end

				do
					local function fn47(arg)
						if not arg or not arg:IsA("Tool") then
							return nil
						end

						local ok, result = pcall(function()
							return tbl18.EggToolDisplay.GetToolUid(arg)
						end)

						if ok and result ~= nil then
							return result
						end

						for _, v75 in ipairs({ "UID", "Uid", "EggUid", "AssetUid", "Id" }) do
							local attribute = arg:GetAttribute(v75)
							if attribute ~= nil then
								return attribute
							end
						end

						return nil
					end

					local function fn48(arg)
						warn("[Tools]", arg)

						local function fn49(arg2)
							if not arg2 then
								return
							end

							for _, child in ipairs(arg2:GetChildren()) do
								if child:IsA("Tool") then
									local tbl22 = {}

									for k, v75 in pairs(child:GetAttributes()) do
										tbl22[#tbl22 + 1] = tostring(k) .. "=" .. tostring(v75)
									end

									local concat = table.concat
									warn(" ", arg2.Name, child.Name, "uid=", fn47(child), concat(tbl22, ", "))
								end
							end
						end

						fn49(tbl17.LocalPlayer:FindFirstChild("Backpack"))
						fn49(tbl17.LocalPlayer.Character)
					end

					fn46 = function(arg)
						do
							local v75, v76 = fn45()
							if not v76 then
								return nil
							end
							local function fn49(arg2)
								if not arg2 then
									return nil
								end

								for _, child in ipairs(arg2:GetChildren()) do
									if child:IsA("Tool") and fn47(child) == arg then
										return child
									end
								end

								return nil
							end
							return fn49(tbl17.LocalPlayer:FindFirstChild("Backpack")) or fn49(v76)
						end
					end

					fn38 = function(arg)
						local value = select(1, fn45())
						if not value then
							return false, "No humanoid"
						end
						local v75 = nil

						for i = 1, 25 do
							v75 = fn46(arg)
							if not v75 then
								task.wait(0.1)
								continue
							end
							break
						end

						if not v75 then
							fn48("missing uid " .. tostring(arg))
							return false, "Tool not found for uid: " .. tostring(arg)
						end
						value:UnequipTools()
						task.wait(0.05)
						value:EquipTool(v75)
						task.wait(0.1)
						local v76, v77 = fn45()
						v77 = v77 and v77:FindFirstChildWhichIsA("Tool")
						if not v77 or fn47(v77) ~= arg then
							return false, "Equipped tool does not match uid"
						end
						return true, v75
					end
				end
			end

			do
				local fn47

				do
					do
						local function fn48(arg, arg2)
							if arg.BaseMutation == arg2 then
								return true
							end

							if arg.Mutations then
								for _, mutation in pairs(arg.Mutations) do
									if mutation == arg2 then
										return true
									end
								end
							end

							return false
						end

						local function fn49(arg)
							if arg.BaseMutation then
								return false
							end

							if arg.Mutations then
								for _, mutation in pairs(arg.Mutations) do
									if mutation then
										return false
									end
								end
							end

							return true
						end

						fn47 = function(arg, arg2)
							if arg.Category ~= arg2.Name then
								return false
							end

							if arg2.Mutation ~= "All" then
								if arg2.Mutation == "None" then
									if not fn49(arg) then
										return false
									end
								elseif not fn48(arg, arg2.Mutation) then
									return false
								end
							end

							if arg2.MaxKG and arg2.MaxKG > 0 then
								local ok, weight = pcall(tbl18.AssetItems.WeightKg, arg)
								if not ok or typeof(weight) ~= "number" or arg2.MaxKG < weight then
									return false
								end
							end

							return true
						end
					end
				end

				do
					local function fn48(arg, arg2, arg3)
						if not arg3[arg] then
							if arg2.InFuse then
								return false
							end

							if arg2.IsFavorite == true then
								return false
							end

							for _, sellPet in ipairs(stealAnEgg.SellPets) do
								if fn47(arg2, sellPet) then
									return true
								end
							end

							return false
						end

						do
							return false
						end
					end

					fn39 = function()
						if #stealAnEgg.SellPets == 0 then
							return 0, "No categories configured"
						end
						local n31 = 0

						while true do
							local v75 = tbl18.Save.Peek()
							assert(v75, "Expected local save data")
							local v76, v77 = fn45()

							if not v76 then
								return n31, "No character/humanoid"
							else
								local tbl22 = {}

								if v75.EquippedAssets then
									for _, equippedAsset in ipairs(v75.EquippedAssets) do
										tbl22[equippedAsset] = true
									end
								end

								local toolNotFoundForUid = nil

								for k, v78 in pairs(v75.Inventory) do
									if fn48(k, v78, tbl22) then
										toolNotFoundForUid = k
										break
									else
										toolNotFoundForUid = nil
									end
								end

								if not toolNotFoundForUid then
									return n31, ("Sold %d pets"):format(n31)
								end
								local v78 = fn46(toolNotFoundForUid)

								if not v78 then
									task.wait(0.3)
									v78 = fn46(toolNotFoundForUid)
									if not v78 then
										return n31, "Tool not found for uid: " .. toolNotFoundForUid
									end
								end

								v76:UnequipTools()
								task.wait(0.1)
								v76:EquipTool(v78)
								task.wait(0.2)
								local tool = v77:FindFirstChildWhichIsA("Tool")
								if not tool or tool:GetAttribute("UID") ~= toolNotFoundForUid then
									break
								end
								tbl19.SellPet:FireServer({ toolNotFoundForUid })
								if
									not waitForSave(function(snapshot)
										return type(snapshot.Inventory) == "table"
											and snapshot.Inventory[toolNotFoundForUid] == nil
									end)
								then
									return n31, "Sale was not confirmed for uid: " .. toolNotFoundForUid
								end
								n31 += 1
								task.wait(0.5)
							end
						end

						return n31, "Failed to equip tool"
					end
				end
			end
		end

		do
			fn40 = function(arg)
				local ok, result = pcall(function()
					do
						local v75 = tbl18.EggItemUtil.DeserializeSavedEgg(arg)
						return tbl18.EggItemUtil.GetDisplayName(v75)
					end
				end)

				if ok then
					return result
				end
				return arg.AreaId and arg.AreaId .. " Egg" or arg.AssetCategory
			end

			do
				local function fn45(arg)
					local ok, result = pcall(function()
						if tbl18.EggItemUtil.GetWeightKgForScale then
							return tbl18.EggItemUtil.GetWeightKgForScale(arg.AssetCategory, arg.AssetScale)
						end
						local v75 = tbl18.EggItemUtil.DeserializeSavedEgg(arg)
						if tbl18.EggItemUtil.GetWeightKg then
							return tbl18.EggItemUtil.GetWeightKg(v75)
						end
						return nil
					end)

					if ok and typeof(result) == "number" then
						return result
					end
					return arg.AssetScale or 0
				end

				local function fn46(arg)
					do
						local assetCategory = arg.AssetCategory
						local v75 = fn27(tbl18.AssetsDir)[assetCategory]
						if not v75 or not v75.Rarity then
							return nil
						end
						return v75.Rarity.DisplayName or v75.Rarity._id
					end
				end

				local function fn47(arg)
					if typeof(arg.BottomCFrame) == "CFrame" then
						return arg.BottomCFrame.Position
					end

					if typeof(arg.BoundsCFrame) == "CFrame" then
						return arg.BoundsCFrame.Position
					end
					return nil
				end

				fn41 = function()
					local v75 = tbl18.EggCmds.RequestAreaEggSnapshot()
					if not v75 or not v75.Records then
						return {}
					end
					local tbl22 = {}

					for _, record in ipairs(v75.Records) do
						if record.State == "Slot" or record.State == "Dropped" then
							table.insert(tbl22, {
								Uid = record.Uid,
								AssetCategory = record.AssetCategory,
								AreaId = record.AreaId,
								NestId = record.NestId,
								AssetScale = record.AssetScale,
								State = record.State,
								Name = fn40(record),
								WeightKg = fn45(record),
								Rarity = fn46(record),
								Position = fn47(record),
								Record = record,
							})
						end
					end

					return tbl22
				end
			end
		end

		fn42 = function()
			local serverTimeNow = tbl17.Workspace:GetServerTimeNow()

			for _, v75 in ipairs({ "SecondsUntilPhaseEnd", "SecondsUntilReset", "GetPhaseTimeLeft", "GetTimeLeft" }) do
				local v76 = tbl18.AreaEggCycle[v75]
				if typeof(v76) ~= "function" then
					continue
				end
				local ok, result = pcall(v76, serverTimeNow)
				local flag14 = not ok

				if not flag14 then
					local v77 = "number"
					flag14 = typeof(result) ~= v77
				end

				if flag14 then
					ok, result = pcall(v76)
				end

				if ok and typeof(result) == "number" then
					return result, v75
				end
			end

			for _, v75 in ipairs({
				"NextResetTime",
				"NextNightTime",
				"GetNextResetAt",
				"GetNightTransitionStartsAt",
				"GetNextNightAt",
			}) do
				local v76 = tbl18.AreaEggCycle[v75]
				if typeof(v76) ~= "function" then
					continue
				end
				local ok, result = pcall(v76, serverTimeNow)

				if not ok or typeof(result) ~= "number" then
					ok, result = pcall(v76)
				end

				if ok and typeof(result) == "number" then
					return math.max(result - serverTimeNow, 0), v75
				end
			end

			return nil, nil
		end

		fn43 = function()
			local v75, v76 = fn42()
			if v75 == nil then
				warn("[StealEggs] could not resolve cycle time left")
				return true, nil
			end

			if v75 < tbl20.StealMinSecondsUntilCycle then
				return false, ("Cycle change too soon: %.1fs via %s"):format(v75, v76)
			end
			return true, v75
		end

		do
			local function fn45(arg)
				if typeof(arg) ~= "string" then
					return ""
				end
				local str7 = string.lower(arg):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")

				if str7:sub(-4) == " egg" then
					str7 = str7:sub(1, -5)
				end

				return str7
			end

			fn44 = function(arg, arg2)
				if arg.Name == arg2 then
					return true
				end

				if arg.AreaId == arg2 then
					return true
				end
				return fn45(arg.Name) == fn45(arg2) or fn45(arg.AreaId) == fn45(arg2)
			end
		end
	end
	local fn45, fn46, fn47, fn48, fn49, fn50, fn51, fn52, fn53, fn54
	do
		do
			local fn55, fn56, fn57, fn58

			do
				do
					fn55 = function(arg)
						local planner = tbl21.FarmPlanner
						if planner then
							if planner.Ignore(arg) or not planner.Qualifies(arg) or not planner.Accessible(arg) then return false end
							if planner.Automatic() then return true end
						end
						for _, stealEgg in ipairs(stealAnEgg.StealEggs) do
							if fn44(arg, stealEgg.Name) then
								local minKG = stealEgg.MinKG or 0
								local flag14 = minKG <= 0

								if not flag14 then
									flag14 = (arg.WeightKg or 0) >= minKG
								end

								if
									flag14
									and (
										not stealEgg.Rarity
										or stealEgg.Rarity == "All"
										or arg.Rarity == stealEgg.Rarity
									)
								then
									return true
								end
							end
						end

						return false
					end

					tbl21.MatchesStealEgg = fn55

					fn56 = function(...)
						if tbl20.Debug.Steal then
							warn("[StealEggs]", ...)
						end
					end

					do
						local function fn59(arg, arg2)
							if not fn44(arg, arg2.Name) then
								local v75 = tostring
								local name = arg2.Name
								return ("name mismatch: egg=%q area=%q cfg=%q"):format(
									tostring(arg.Name),
									tostring(arg.AreaId),
									v75(name)
								)
							end

							local minKG = arg2.MinKG or 0
							local flag14 = minKG <= 0

							if not flag14 then
								flag14 = (arg.WeightKg or 0) >= minKG
							end

							if not flag14 then
								return ("weight too low: %.3f < MinKG %d"):format(arg.WeightKg or 0, minKG)
							end

							if not (not arg2.Rarity or arg2.Rarity == "All" or arg.Rarity == arg2.Rarity) then
								local v75 = tostring
								local rarity = arg2.Rarity
								return ("rarity mismatch: egg=%q cfg=%q"):format(tostring(arg.Rarity), v75(rarity))
							end

							if not arg.Position then
								return "matched config but no Position"
							end
							return "matched"
						end

						fn57 = function(arg, arg2)
							if not tbl20.Debug.Steal then
								return
							end
							local records = tbl18.EggCmds.RequestAreaEggSnapshot()
							records = records and records.Records or {}
							arg2 = arg2 or fn41()
							fn56(("=== zone eggs debug (%s) ==="):format(arg or "?"))
							fn56("snapshot records", #records, "matches", #arg2)
							if #records == 0 then
								fn56("no records in snapshot")
								return
							end
							local tbl22 = {}

							for _, record in ipairs(records) do
								local str7 = tostring(record.State)
								tbl22[str7] = (tbl22[str7] or 0) + 1
							end

							fn56("states", tbl22)

							if #arg2 == 0 then
								fn56("no Slot/Dropped eggs in snapshot")

								for i, record in ipairs(records) do
									if i <= 8 then
										fn56(
											"record",
											i,
											"state",
											record.State,
											"AreaId",
											record.AreaId,
											"AssetCategory",
											record.AssetCategory,
											"UiName",
											fn40(record)
										)
									end
								end

								return
							end

							for i, v75 in ipairs(arg2) do
								local str7 = v75.Position and tostring(v75.Position) or "nil"
								local name = v75.Name
								local rarity = v75.Rarity
								local weightKg = v75.WeightKg
								local state = v75.State
								local areaId = v75.AreaId
								local nestId = v75.NestId
								local assetCategory = v75.AssetCategory
								fn56(
									("egg[%d]"):format(i),
									"Name",
									name,
									"Rarity",
									rarity,
									"KG",
									weightKg,
									"State",
									state,
									"Area",
									areaId,
									"Nest",
									nestId,
									"Category",
									assetCategory,
									"Pos",
									str7
								)
								local flag14 = false

								for i2, stealEgg in ipairs(stealAnEgg.StealEggs) do
									local v76 = fn59(v75, stealEgg)
									fn56(
										("  cfg[%d]"):format(i2),
										stealEgg.Name,
										stealEgg.Rarity or "All",
										"MinKG",
										stealEgg.MinKG or 0,
										"->",
										v76
									)

									if v76 == "MATCH" then
										flag14 = true
									end
								end

								if not flag14 then
									fn56("  => no StealEggs rule matched")
								end
							end

							fn56("configured StealEggs:")

							for i, stealEgg in ipairs(stealAnEgg.StealEggs) do
								fn56(
									("  rule[%d]"):format(i),
									"Name",
									stealEgg.Name,
									"Rarity",
									stealEgg.Rarity or "All",
									"MinKG",
									stealEgg.MinKG or 0
								)
							end
						end
					end
				end

				do
					local fn59, fn60

					do
						fn45 = function()
							if #stealAnEgg.StealEggs == 0 and not (tbl21.FarmPlanner and tbl21.FarmPlanner.Automatic()) then
								return false
							end
							local v75 = fn41()

							for _, v76 in ipairs(v75) do
								if fn55(v76) and v76.Position then
									return true
								end
							end

							fn57("hasMatchingStealTarget=false", v75)
							return false
						end

						fn46 = function(eggs)
							local n31 = 0

							for _, v75 in ipairs(eggs or fn41()) do
								if fn55(v75) and v75.Position then
									n31 += 1
								end
							end

							return n31
						end

						fn47 = function()
							local character = tbl17.LocalPlayer.Character
							if not character then
								return nil
							end
							return character:FindFirstChild("HumanoidRootPart")
						end

						do
							local function fn61()
								local character = tbl17.LocalPlayer.Character
								if not character then
									return nil
								end
								return character:FindFirstChildWhichIsA("Humanoid")
							end

							fn48 = function(arg)
								if not arg then
									return
								end

								pcall(function()
									arg.AssemblyLinearVelocity = Vector3.zero

									arg.AssemblyAngularVelocity = Vector3.zero
								end)
							end

							fn49 = function(platformStand)
								local v75 = fn47()
								local v76 = fn61()

								if v75 then
									v75.Anchored = false
									fn48(v75)
								end

								if v76 then
									pcall(function()
										v76.PlatformStand = platformStand

										if platformStand then
											v76:ChangeState(Enum.HumanoidStateType.Physics)
										else
											do
												v76:ChangeState(Enum.HumanoidStateType.Running)
											end
										end
									end)
								end
							end

							fn50 = function(forceStealPosition)
								local v75 = fn47()
								if not v75 then
									return false, "No HumanoidRootPart"
								end
								v75.Anchored = false
								fn48(v75)
								local position = v75.Position
								local n31 = math.max(
									(position - forceStealPosition).Magnitude / math.max(tbl20.StealFlySpeed, 1),
									0.05
								)
								local now2 = os.clock()

								while true do
									local v76 = fn47()
									if not v76 or not v76.Parent then
										return false, "Root lost during tween"
									end
									local n32 = math.min((os.clock() - now2) / n31, 1)
									local v77 = position:Lerp(forceStealPosition, n32)
									v76.CFrame = CFrame.new(v77)
									fn48(v76)
									stealAnEgg.ForceStealPosition = v77
									if n32 >= 1 then
										break
									end
									task.wait()
								end

								local v76 = fn47()

								if v76 then
									v76.CFrame = CFrame.new(forceStealPosition)
									fn48(v76)
									stealAnEgg.ForceStealPosition = forceStealPosition
								end

								return true
							end

							fn59 = function(forceStealPosition, arg)
								local n31 = os.clock() + arg

								while os.clock() < n31 do
									local v75 = fn47()

									if v75 then
										v75.Anchored = false
										v75.CFrame = CFrame.new(forceStealPosition)
										fn48(v75)
									end

									stealAnEgg.ForceStealPosition = forceStealPosition
									task.wait()
								end
							end

							fn60 = function()
								local v75 = fn61()

								if v75 then
									pcall(function()
										v75.PlatformStand = false
										v75.Sit = false

										if v75.Health <= 0 then
											v75.Health = v75.MaxHealth
										end

										v75:ChangeState(Enum.HumanoidStateType.Running)
									end)

									return v75.Health > 0
								end

								do
									return false
								end
							end
						end
					end

					do
						local function fn61(arg)
							local tbl22 = { Uid = arg.Uid }
							local ok

							if tbl18.AreaEggSlotIdentity.LooksLikeFirstAreaUid then
								local result
								ok, result = pcall(tbl18.AreaEggSlotIdentity.LooksLikeFirstAreaUid, arg.Uid)
								ok = ok and result == true
							else
								local v75 = "string"
								ok = typeof(arg.Uid) == v75 and string.find(arg.Uid, "FirstAreaEgg_", 1, true) ~= nil
							end

							if ok and arg.AreaId and arg.NestId then
								do
									local firstAreaSlotKey = nil
									if tbl18.AreaEggSlotIdentity.SlotKey then
										local ok2
										ok2, firstAreaSlotKey =
											pcall(tbl18.AreaEggSlotIdentity.SlotKey, arg.AreaId, arg.NestId)
										local v75 = nil

										if not ok2 then
											firstAreaSlotKey = v75
										end
									end
									tbl22.FirstAreaSlotKey = firstAreaSlotKey or arg.AreaId .. ":" .. arg.NestId
								end
							end

							if tbl18.EggCmds.RequestCarryAreaEgg then
								return tbl18.EggCmds.RequestCarryAreaEgg(arg.Uid, tbl22.FirstAreaSlotKey)
							end
							return tbl19.RequestAreaEggCarry:InvokeServer(tbl22)
						end

						fn58 = function(arg, arg2)
							for i = 1, 3 do
								fn60()
								fn59(arg2, tbl20.StealReplicateWait + (i - 1) * 0.5)
								local v75 = fn47()
								fn56("pre-carry", i, v75 and v75.Position, "force", stealAnEgg.ForceStealPosition)
								local v76, v77 = fn61(arg)
								fn56("carry result", i, v76, v77, "pos now", fn47() and fn47().Position)
								if v76 then
									return true
								end
								local str7 = tostring(v77 or "")
								if
									str7:find("far", 1, true)
									or str7:find("distance", 1, true)
									or str7:find("closer", 1, true)
								then
									task.wait(0.35)
									continue
								end
								return false, v77
							end

							return false, "Carry failed after retries"
						end
					end
				end
			end

			do
				local function fn59(arg)
					return fn38(arg)
				end

				local function fn60(arg)
					if not arg.Position then
						return false, "Egg position is missing"
					end
					fn29(("Stealing: %s (%.1f kg)"):format(arg.Name, arg.WeightKg or 0))
					local v75, v76 = fn43()
					fn56("cycle check", v75, v76)
					if not v75 then
						return false, v76
					end
					local v77 = fn47()
					if not v77 then
						return false, "No HumanoidRootPart"
					end
					local previousEggs = {}
					local snapshot = tbl18.Save.Peek()
					for uid in pairs(snapshot and snapshot.EggInventory or {}) do
						previousEggs[uid] = true
					end
					local stealReturnPosition = tbl20.StealReturnPosition
					local position = arg.Position
					local stealHeightOffset = tbl20.StealHeightOffset
					local n31 = position + Vector3.new(0, tbl20.StealLandOffset, 0)
					local n32 = v77.Position + Vector3.new(0, stealHeightOffset, 0)
					local n33 = position + Vector3.new(0, stealHeightOffset, 0)
					fn56("target", arg.Name, arg.Uid, "area", arg.AreaId, "nest", arg.NestId)
					fn56("weight", arg.WeightKg, "eggPos", position, "landPos", n31)
					fn56("from", v77.Position, "return", stealReturnPosition)
					local n34 = v77.Position + Vector3.new(0, stealHeightOffset, 0)
					local n35 = stealReturnPosition + Vector3.new(0, stealHeightOffset, 0)
					fn49(true)
					fn56("flight ON (no anchor, PlatformStand)")

					local function fn61(arg2)
						stealAnEgg.ForceStealPosition = nil
						fn49(false)
						return false, arg2
					end

					local v78, v79 = fn50(n34)
					fn56("tween highHere", v78, v79, fn47() and fn47().Position)
					if not v78 then
						local v80, v81 = fn61(v79)
						return v80, v81
					end
					local v80, v81 = fn50(n35)
					fn56("tween highReturn", v80, v81, fn47() and fn47().Position)
					if not v80 then
						local v82, v83 = fn61(v81)
						return v82, v83
					end
					local v82, v83 = fn50(stealReturnPosition)
					fn56("tween returnPos (pre)", v82, v83, fn47() and fn47().Position)

					if v82 then
						local v84, v85 = fn50(n35)
						fn56("tween highReturn2", v84, v85, fn47() and fn47().Position)
						if not v84 then
							local v86, v87 = fn61(v85)
							return v86, v87
						end
						local v86, v87 = fn50(n33)
						fn56("tween highEgg", v86, v87, fn47() and fn47().Position)
						if not v86 then
							local v88, v89 = fn61(v87)
							return v88, v89
						end
						local v88, v89 = fn50(n31)
						fn56("tween landPos", v88, v89, fn47() and fn47().Position)
						if not v88 then
							local v90, v91 = fn61(v89)
							return v90, v91
						end
						fn49(false)
						local v90, v91 = fn58(arg, n31)
						if not v90 then
							return false, v91 or "Carry failed"
						end
						fn49(true)
						local v92 = fn47()
						if not v92 then
							fn49(false)
							return false, "Failed to return"
						end
						local position2 = v92.Position
						local n36 = position2.Y + stealHeightOffset
						local vector =
							Vector3.new(stealReturnPosition.X - position2.X, 0, stealReturnPosition.Z - position2.Z)
						local magnitude = vector.Magnitude
						local unit = magnitude > 0.001 and vector.Unit or Vector3.new(0, 0, -1)
						local n37 = math.min(tbl20.StealClimbHoriz, math.max(magnitude * 0.2, 20))

						if magnitude < n37 then
							n37 = magnitude
						end

						local vector2 = Vector3.new(position2.X + unit.X * n37, n36, position2.Z + unit.Z * n37)
						local vector3 = Vector3.new(stealReturnPosition.X, n36, stealReturnPosition.Z)
						fn56("return climb", vector2, "cruise", vector3, "from", position2, "distance", magnitude)
						local v93, v94 = fn50(vector2)
						fn56("tween climbPos", v93, v94, fn47() and fn47().Position)
						if not v93 then
							fn49(false)
							return false, v94
						end

						if (vector2 - vector3).Magnitude > 1 then
							local v95, v96 = fn50(vector3)
							fn56("tween cruisePos", v95, v96, fn47() and fn47().Position)
							if not v95 then
								fn49(false)
								return false, v96
							end
						end

						local v95, v96 = fn50(stealReturnPosition)
						fn56("tween returnPos", v95, v96, fn47() and fn47().Position)
						if not v95 then
							fn49(false)
							return false, v96
						end
						fn49(false)
						fn56("carried", arg.Uid)
						local grantedUid
						if
							not waitForSave(function(current)
								grantedUid = findGrantedEgg(current, arg, previousEggs)
								return grantedUid ~= nil
							end)
						then
							return false, "Carried egg was not confirmed in inventory"
						end
						local v97, v98 = fn59(grantedUid)
						fn56("equip result", v97, v98)
						if tbl21.FarmPlanner then tbl21.FarmPlanner.RegisterEgg(grantedUid) end
						return true, arg.Name
					end

					do
						local v84, v85 = fn61(v83)
						return v84, v85
					end
				end

				fn51 = function(maxEggs, targetUid)
					if #stealAnEgg.StealEggs == 0 and not (tbl21.FarmPlanner and tbl21.FarmPlanner.Automatic()) then
						return 0, "No StealEggs configured"
					end
					fn30("Steal Mode")
					fn29("Scanning steal targets...")
					fn57("autoStealEggs start")
					local v75 = 0
					local processed = {}
					local v76

					while true do
						local v77, v78 = fn43()

						if not v77 then
							fn56("cycle blocked steal", v78)
							fn57("cycle blocked")
							return v75, v78
						else
							local v79 = nil

							if tbl21.FarmPlanner then
								v79 = tbl21.FarmPlanner.Choose(fn41(), processed, targetUid)
							else
								for _, egg in ipairs(fn41()) do
									if egg.Uid and not processed[egg.Uid] and fn55(egg) and egg.Position then v79 = egg break end
								end
							end

							if not v79 then
								if v75 == 0 then
									fn57("autoStealEggs no target")
								end

								return v75, ("Stolen %d eggs"):format(v75)
							end

							local ok, v80, result = pcall(fn60, v79)
							stealAnEgg.ForceStealPosition = nil
							fn49(false)
							v76 = ok and result or tostring(v80)
							if not ok then
								break
							end
							if not v80 then
								break
							end
							processed[v79.Uid] = true
							v75 += 1
							if maxEggs and v75 >= maxEggs then return v75, ("Stolen %d eggs"):format(v75) end
							task.wait(0.3)
						end
					end

					return v75, v76
				end
			end
		end

		do
			local fn55, fn56, fn57, fn58, fn59, fn60, fn61

			do
				do
					fn55 = function(arg, uid)
						if arg.Placement == nil then
							return false
						end
						if typeof(tbl18.EggState.IsReadyToHatch) == "function" then
							local ok, ready = pcall(tbl18.EggState.IsReadyToHatch, uid)
							return ok and ready == true
						end
						local serverTimeNow = tbl17.Workspace:GetServerTimeNow()
						local readyAt = arg.Placement.ReadyAt

						if typeof(readyAt) == "number" then
							return serverTimeNow >= readyAt
						end

						if typeof(tbl18.EggGrowth.IsReady) == "function" then
							local ok, result = pcall(tbl18.EggGrowth.IsReady, arg)
							if ok and typeof(result) == "boolean" then
								return result
							end
						end

						local v75 = 0
						local result

						if typeof(tbl18.EggItemUtil.GetCurrentNightGrowthCreditSeconds) == "function" then
							local ok
							ok, result = pcall(
								tbl18.EggItemUtil.GetCurrentNightGrowthCreditSeconds,
								arg,
								serverTimeNow,
								arg.GrowthSpeedMultiplier
							)

							if not (ok and typeof(result) == "number") then
								result = v75
							end
						else
							result = v75
						end

						if typeof(tbl18.EggItemUtil.GetGrowthAlpha) == "function" then
							local ok, result2 = pcall(
								tbl18.EggItemUtil.GetGrowthAlpha,
								arg,
								serverTimeNow,
								arg.GrowthSpeedMultiplier,
								result,
								tbl17.LocalPlayer
							)
							if ok and typeof(result2) == "number" then
								return result2 >= 1
							end
						end

						return false
					end

					tbl21.hatchWebhookHooked = false

					fn56 = function(arg)
						local request_ = syn and syn.request
							or http_request
							or request
							or http and http.request
							or fluxus and fluxus.request
						if typeof(request_) == "function" then
							return request_(arg)
						end
						return tbl17.HttpService:RequestAsync({
							Url = arg.Url,
							Method = arg.Method or "POST",
							Headers = arg.Headers,
							Body = arg.Body,
						})
					end

					fn57 = function(arg)
						if not arg then
							return "None"
						end
						local v75 = "string"
						if typeof(arg.BaseMutation) == v75 and arg.BaseMutation ~= "" then
							return arg.BaseMutation
						end
						local mutations = arg.Mutations
						if typeof(mutations) ~= "table" then
							return "None"
						end
						local tbl22 = {}

						for k, mutation in pairs(mutations) do
							if typeof(mutation) == "string" then
								table.insert(tbl22, mutation)
							elseif typeof(k) == "string" and mutation == true then
								table.insert(tbl22, k)
							end
						end

						if #tbl22 == 0 then
							return "None"
						end
						table.sort(tbl22)
						return table.concat(tbl22, ", ")
					end

					fn58 = function(arg)
						local v75 = 0

						do
							local v76 = fn27(tbl18.AssetsDir)[arg]
							if not v76 or not v76.Rarity then
								return nil, 5763719
							end
							local rarity = v76.Rarity
							local displayName = rarity.DisplayName or rarity._id or "Unknown"
							local n31 = 5763719
							if rarity.Color then
								local color = rarity.Color
								local v77 = 65536
								n31 = math.floor(color.R * 255 + 0.5) * v77
									+ math.floor(color.G * 255 + 0.5) * 256
									+ math.floor(color.B * 255 + 0.5)
							end
							return displayName, n31
						end
					end

					do
						local function fn62(arg)
							if typeof(arg) ~= "string" then
								return ""
							end
							local lower = string.lower
							local str7 = arg:gsub("%s+", "")
							return lower(str7)
						end

						local function fn63(arg, arg2)
							local v75 = fn62(arg)
							if v75 == "" then
								return false
							end
							return arg2[v75] == true
						end

						local function fn64(arg)
							local tbl22 = {}
							local v75 = "table"
							if typeof(arg) ~= v75 then
								return tbl22
							end

							for _, v76 in ipairs(arg) do
								local v77 = fn62(v76)

								if v77 ~= "" then
									tbl22[v77] = true
								end
							end

							return tbl22
						end

						tbl20.PrivateHatchRaritySet = fn64(stealAnEgg.PrivateHatchWebhookRarities)
						tbl20.GlobalHatchWebhookRarities = fn64({ "Secret", "Eternal", "Divine" })

						fn59 = function(arg)
							if arg then
								arg = arg.Category or arg.AssetCategory
							end

							if not arg then
								return false
							end
							local privateHatchRaritySet = tbl20.PrivateHatchRaritySet
							return fn63(fn58(arg), privateHatchRaritySet)
						end

						fn60 = function(arg)
							local category = arg and (arg.Category or arg.AssetCategory)
							if not category then
								return false
							end
							local globalHatchWebhookRarities = tbl20.GlobalHatchWebhookRarities
							return fn63(fn58(category), globalHatchWebhookRarities)
						end
					end
				end

				tbl21.petImgCache = {}

				do
					local function fn62(arg)
						if not arg or arg == "" then
							return ""
						end
						local str7 = "https://thumbnails.roblox.com/v1/assets?assetIds="
							.. tostring(arg)
							.. "&size=150x150&format=Png&isCircular=false"
						local v75 = request or http_request
						local request_

						if v75 then
							request_ = v75
						else
							request_ = syn and syn.request
						end

						if not request_ then
							return ""
						end

						local ok, result = pcall(function()
							return request_({ Url = str7, Method = "GET" })
						end)

						if not ok or not result or not result.Body then
							return ""
						end
						local ok2, result2 = pcall(tbl17.HttpService.JSONDecode, tbl17.HttpService, result.Body)
						if not ok2 or not result2 or not result2.data or not result2.data[1] then
							return ""
						end
						return result2.data[1].imageUrl or ""
					end

					local function fn63(arg)
						if tbl21.petImgCache[arg] ~= nil then
							return tbl21.petImgCache[arg]
						end
						local v75 = fn27(tbl18.AssetsDir)[arg]
						local icon = v75 and v75.Icon
						local str7 = ""

						if icon then
							do
								str7 = tostring(v75.Icon):gsub("rbxassetid://", "")
							end
						end

						local v76 = fn62(str7)
						tbl21.petImgCache[arg] = v76
						return v76
					end

					fn61 = function(arg)
						local v75 = fn63(arg)
						if not v75 or v75 == "" then
							return nil
						end
						return v75
					end
				end
			end

			do
				do
					local function fn62(arg, arg2)
						do
							local n31 = os.clock() + (arg2 or 3)
							while os.clock() < n31 do
								local v75 = tbl18.Save.Peek()

								if v75 then
									local inventory = v75.Inventory and v75.Inventory[arg]
									if inventory then
										return inventory
									end
									local equippedAssets = v75.EquippedAssets and v75.EquippedAssets[arg]
									if equippedAssets then
										return equippedAssets
									end
								end

								task.wait(0.05)
							end
							return nil
						end
					end

					BuildSafePing = function()
						local discordId = stealAnEgg.DiscordId or ""
						if type(discordId) ~= "string" or discordId == "" then
							return ""
						end
						local match = discordId:match("^%s*(.-)%s*$") or ""
						if match == "everyone" or match == "@everyone" or match == "here" or match == "@here" then
							return ""
						end

						if match:match("^%d+$") then
							return "<@" .. match .. ">"
						end

						return ""
					end

					local function fn63(arg, arg2)
						if typeof(arg) ~= "string" or arg == "" then
							return false, "empty url"
						end
						local request_ = request or http_request or syn and syn.request or fn56
						local json = tbl17.HttpService:JSONEncode(arg2)

						local ok, result = pcall(function()
							return request_({
								Url = arg,
								Method = "POST",
								Headers = { ["Content-Type"] = "application/json" },
								Body = json,
							})
						end)

						local flag14 = ok and type(result) == "table"
						local statusCode = nil

						if flag14 then
							statusCode = result.StatusCode or result.Status_code or result.status_code or result.Status
						end

						if not ok or statusCode and (statusCode < 200 or statusCode >= 300) then
							return false, ok and statusCode or result, typeof(result) == "table" and result.Body or nil
						end
						return true
					end

					local function fn64(arg, arg2)
						local category = arg2 and (arg2.Category or arg2.AssetCategory) or "Unknown"
						local scale = arg2 and arg2.Scale
						local str7 = typeof(scale) == "number" and ("%.3f"):format(scale) or "?"
						local v75 = fn57(arg2)
						local v76, v77 = fn58(category)
						local v78 = fn61(category)
						local tbl22 = { title = "Egg Hatched!", description = ("**%***"):format(category), color = v77 }
						local fields = {}
						local tbl23 = { name = "Scale", value = str7, inline = true }
						local tbl24 = { name = "Rarity", value = v76 or "?", inline = true }
						fields[1] = tbl23
						fields[2] = tbl24
						fields[3] = { name = "Mutation", value = v75, inline = true }
						tbl22.fields = fields
						tbl22.footer = { text = "StealAnEgg" }
						tbl22.timestamp = DateTime.now():ToIsoDate()

						if v78 then
							tbl22.thumbnail = { url = v78 }
						end

						if arg == "private" then
							tbl22.author = { name = tbl17.LocalPlayer.Name }
						end

						return tbl22, category, str7
					end

					local function fn65(arg, arg2, arg3)
						local v75 = BuildSafePing()
						local category = arg3 and (arg3.Category or arg3.AssetCategory) or "Unknown"
						local v76 = fn58(category)

						if fn59(arg3) then
							local private = fn64("private", arg3)
							local tbl22 = { username = tbl20.HatchWebhookUsername, embeds = { private } }

							if v75 then
								tbl22.content = v75
							end

							local v77, v78, v79 = fn63(stealAnEgg.PrivateHatchWebhookUrl, tbl22)

							if v77 then
								warn("[HatchWebhook] private sent", category, v76)
							else
								warn("[HatchWebhook] private failed:", v78, v79)
							end
						end

						if fn60(arg3) then
							local global = fn64("global", arg3)
							local tbl22 = { username = tbl20.HatchWebhookUsername, embeds = { global } }

							if stealAnEgg.ShowPingInGlobalWebhook and v75 then
								tbl22.content = v75
							end

							local v77, v78, v79 = fn63(tbl20.GlobalHatchWebhookUrl, tbl22)

							if v77 then
								warn("[HatchWebhook] global sent", category, v76)
							else
								warn("[HatchWebhook] global failed:", v78, v79)
							end
						end
					end

					fn52 = function()
						if tbl21.hatchWebhookHooked then
							return
						end
						tbl21.hatchWebhookHooked = true
						local eggState = tbl18.EggState
						local v75 = "FinishHatch"
						local v76 = "function"

						if typeof(eggState[v75]) ~= v76 then
							eggState = tbl18.EggCmds
							v75 = "RequestCompleteHatchEgg"
						end

						if typeof(eggState[v75]) ~= "function" then
							warn("[HatchWebhook] no FinishHatch/RequestCompleteHatchEgg to hook")

							return
						end

						local v77 = eggState[v75]

						eggState[v75] = function(arg)
							local v78, v79, v80 = v77(arg)

							if v78 and typeof(v80) == "string" then
								task.spawn(function()
									local v81 = fn62(v80, 3)
									warn(
										"[HATCH DROP]",
										"egg",
										arg,
										"petUid",
										v80,
										"name",
										v81 and v81.Category,
										"scale",
										v81 and v81.Scale
									)
									fn65(arg, v80, v81)
								end)
							end

							do
								return v78, v79, v80
							end
						end

						tbl18.EggCmds.RequestCompleteHatchEgg = eggState[v75]
					end
				end
			end

			fn53 = function()
				fn52()
				local v75 = tbl18.EggCmds.GetOwnerRuntimeRecords(tbl17.LocalPlayer.UserId)
				if not v75 then
					return 0, "No runtime records"
				end
				local tbl22 = {}

				for k, v76 in pairs(v75) do
					if fn55(v76, k) then
						table.insert(tbl22, k)
					end
				end

				local n31 = 0

				for _, v76 in ipairs(tbl22) do
					local ok, v77, v78 = pcall(tbl18.PlacedEggRenderer.ActivateLocalEgg, v76)

					if ok and v77 then
						if
							waitForSave(function(snapshot)
								return type(snapshot.EggInventory) == "table" and snapshot.EggInventory[v76] == nil
							end)
						then
							n31 += 1
						else
							warn("[HatchEggs] completion was not confirmed", v76)
						end
						pcall(tbl18.PlacedEggRenderer.Refresh)
					else
						warn("[HatchEggs] failed", v76, ok and v78 or v77)
						task.wait(0.3)
					end
				end

				return n31, ("Hatched %d/%d eggs"):format(n31, #tbl22)
			end
		end

		do
			local function fn55(arg)
				local assetCategory = arg.AssetCategory
				local v75 = fn27(tbl18.AssetsDir)[assetCategory]
				if not v75 or not v75.Rarity then
					return nil
				end
				return v75.Rarity.DisplayName or v75.Rarity._id
			end

			local function fn56(arg)
				if arg.AreaId then
					local str7 = tostring(arg.AreaId)
					local str8 = str7:sub(-4)
					local v75 = " egg"

					if str8:lower() ~= v75 then
						str7 ..= " Egg"
					end

					return str7
				end

				local v75 = tbl18.EggAreaNameByCategory[arg.AssetCategory]
				if v75 then
					return v75
				end

				if
					typeof(tbl18.EggItemUtil.DeserializeSavedEgg) == "function"
					and typeof(tbl18.EggItemUtil.GetDisplayName) == "function"
				then
					do
						local ok, result = pcall(tbl18.EggItemUtil.DeserializeSavedEgg, arg)
						if ok and result then
							local ok2, result2 = pcall(tbl18.EggItemUtil.GetDisplayName, result)
							if ok2 and result2 then
								return result2
							end
						end
					end
				end

				return arg.AssetCategory
			end

			fn54 = function(arg, arg2)
				local name = arg2.Name
				if fn56(arg) ~= name then
					return false
				end

				if arg2.Rarity and arg2.Rarity ~= "All" then
					local rarity = arg2.Rarity
					if fn55(arg) ~= rarity then
						return false
					end
				end

				return true
			end
		end
	end
	local fn55, fn56, fn57, fn58, fn59, fn60
	do
		do
			do
				local function fn61()
					local getPlotData = tbl18.PlotCmds and tbl18.PlotCmds.GetPlotData
					local v75 = "function"
					if typeof(getPlotData) ~= v75 then
						warn("[PlaceEggs] GetPlotData missing after module relocate")
						return nil
					end
					local v76 = getPlotData()
					if not v76 then
						return nil
					end
					local cFrame = v76.CenterPoint.CFrame
					local petArea = v76.PetArea
					local cFrame2 = petArea.CFrame
					local size = petArea.Size
					local v77 = cFrame:ToObjectSpace(cFrame2)
					local y = v77.Y
					local cframe = CFrame.new(0, 0, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
					local n31 = math.max(size.X * 0.5 - 2, 2)
					local n32 = math.max(size.Z * 0.5 - 2, 2)
					local placeEggSpacing = stealAnEgg.PlaceEggSpacing
					local tbl22 = {}

					for i = -n31, n31 + 0.001, placeEggSpacing do
						for i2 = -n32, n32 + 0.001, placeEggSpacing do
							local v78 = cFrame:PointToObjectSpace((cFrame2 * CFrame.new(i, 0, i2)).Position)
							local vector = Vector3.new(v78.X, y, v78.Z)
							table.insert(tbl22, CFrame.new(vector) * cframe)
								if #tbl22 % 64 == 0 then task.wait() end
						end
					end

					warn(
						"[PlaceEggs] grid",
						#tbl22,
						"spacing",
						placeEggSpacing,
						"petSize",
						size,
						"localY",
						y,
						"petLocal",
						v77.Position
					)
					return tbl22, v76
				end

				local function fn62()
					local tbl22 = {}

					local v75 = tbl18.EggCmds.GetOwnerRuntimeRecords(tbl17.LocalPlayer.UserId)
					if not v75 then
						return tbl22
					end

					for _, v76 in pairs(v75) do
						local placement = v76.Placement

						if placement and typeof(placement.LocalCFrame) == "CFrame" then
							table.insert(tbl22, placement.LocalCFrame)
						elseif placement and typeof(placement.CFrame) == "CFrame" then
							table.insert(tbl22, placement.CFrame)
						end
					end

					return tbl22
				end

				local function fn63(arg, arg2, arg3)
					local n31 = arg3 or 2.5
					local position = arg.Position

					for _, v75 in ipairs(arg2) do
						if (v75.Position - position).Magnitude < n31 then
							return false
						end
					end

					return true
				end

				local function fn64(forceStealPosition)
					local v75 = fn47()

					if not v75 then
						do
							do
								return false, "No HumanoidRootPart"
							end
						end
					else
						local stealHeightOffset = tbl20.StealHeightOffset
						local n31 = v75.Position + Vector3.new(0, stealHeightOffset, 0)
						local n32 = forceStealPosition + Vector3.new(0, stealHeightOffset, 0)
						fn49(true)
						warn("[Fly] via height to", forceStealPosition, "from", v75.Position)
						local v76, v77 = fn50(n31)

						if not v76 then
							fn49(false)
							stealAnEgg.ForceStealPosition = nil
							return false, v77
						end

						local v78, v79 = fn50(n32)

						if v78 then
							local v80, v81 = fn50(forceStealPosition)

							if not v80 then
								fn49(false)
								stealAnEgg.ForceStealPosition = nil
								return false, v81
							end

							stealAnEgg.ForceStealPosition = forceStealPosition
							local n33 = os.clock() + (tbl20.StealReplicateWait or 0.75)

							while os.clock() < n33 do
								local v82 = fn47()

								if v82 then
									v82.CFrame = CFrame.new(forceStealPosition)
									fn48(v82)
								end

								task.wait()
							end

							fn49(false)
							stealAnEgg.ForceStealPosition = nil
							warn("[Fly] arrived", fn47() and fn47().Position)
							return true
						end

						do
							fn49(false)
							stealAnEgg.ForceStealPosition = nil
							return false, v79
						end
					end
				end

				local function fn65(arg)
					if arg and arg.CenterPoint then
						return arg.CenterPoint.CFrame.Position + Vector3.new(0, 2, 0)
					end
					return tbl20.StealReturnPosition
				end

				fn55 = function()
					local v75 = tbl18.Save.Peek()
					assert(v75, "Save data is not loaded")
					if not v75.EggInventory then
						return 0, "No egg inventory"
					end
					if #stealAnEgg.PlaceEggs == 0 and not (tbl21.FarmPlanner and tbl21.FarmPlanner.PendingCount() > 0) then
						return 0, "No new eggs to place"
					end
					local v76, v77 = fn61()

					if not (not v76 or #v76 == 0) then
						local v78 = tbl18.EggCmds.GetOwnerRuntimeRecords(tbl17.LocalPlayer.UserId)
						local tbl22 = {}

						if v78 then
							for k, v79 in pairs(v78) do
								if v79.Placement ~= nil then
									tbl22[k] = true
								end
							end
						end

						local tbl23 = {}

						for k, v79 in pairs(v75.EggInventory) do
							if not tbl22[k] then
								if #stealAnEgg.PlaceEggs == 0 and tbl21.FarmPlanner and tbl21.FarmPlanner.AutoPlace(k) then
									table.insert(tbl23, k)
								end
								for _, placeEgg in ipairs(stealAnEgg.PlaceEggs) do
									if fn54(v79, placeEgg) then
										table.insert(tbl23, k)
										break
									end
								end
							end
						end

						if #tbl23 == 0 then
							return 0, "No eggs matched PlaceEggs"
						end
						local v79 = fn62()
						local tbl24 = {}

						for _, v80 in ipairs(v76) do
							if fn63(v80, v79) then
								table.insert(tbl24, v80)
							end
						end

						warn("[PlaceEggs] unplaced", #tbl23, "freeSlots", #tbl24, "occupied", #v79)
						if #tbl24 == 0 then
							return 0, "No free plot slots"
						end
						local v80 = fn65(v77)
						local v81, v82 = fn64(v80)
						if not v81 then
							return 0, v82 or "No free egg placement positions"
						end
						local v83 = 0
						local placeEggMaxTriesPerEgg = stealAnEgg.PlaceEggMaxTriesPerEgg
						local n31 = 1
						local flag14

						for _, v84 in ipairs(tbl23) do
							if not (#tbl24 < n31) then
								local ok, result, result2 = pcall(tbl18.EggCmds.RequestWearEggTool, v84)
								warn("[PlaceEggs] wear", v84, ok, result, result2)

								if not ok or result == false then
									warn("[PlaceEggs] WearEggTool failed", v84, result2 or result)
									continue
								else
									task.wait(0.15)
									local v85, v86 = fn38(v84)
									warn("[PlaceEggs] equip", v84, v85, v86)

									if not v85 then
										warn("[PlaceEggs] equip failed after WearEggTool", v84)
										continue
									else
										task.wait(0.15)
										local v87 = 0

										while true do
											local flag15 = n31 <= #tbl24 and v87 < placeEggMaxTriesPerEgg
											flag14 = false

											if flag15 then
												local v88 = tbl24[n31]
												n31 += 1
												v87 += 1
												local placePosition = v77.CenterPoint.CFrame:PointToWorldSpace(
													v88.Position
												) + Vector3.new(0, 3, 0)
												local moved, moveReason = fn64(placePosition)
												if not moved then
													return v83, moveReason or "Could not reach egg placement position"
												end
												local response2, v89

												if tbl18.EggCmds.RequestPlaceEgg then
													response2, v89 = tbl18.EggCmds.RequestPlaceEgg(v84, v88)
												else
													response2, v89 = tbl19.RequestPlaceEgg:InvokeServer({
														Uid = v84,
														LocalCFrame = v88,
													})
												end

												warn(
													"[PlaceEggs] try",
													v84,
													"ok",
													response2,
													v89,
													"local position",
													v88.Position
												)

												if response2 then
													v83 += 1
													table.insert(v79, v88)
													task.wait(0.25)
													flag14 = true
													break
												else
													continue
												end
											end

											break
										end

										if not flag14 then
											warn("[PlaceEggs] give up uid", v84, "tries", v87)
											break
										else
											continue
										end
									end
								end
							end

							break
						end

						return v83, ("Placed %d/%d eggs"):format(v83, #tbl23)
					end

					do
						return 0, "No plot data / no positions"
					end
				end
			end
		end

		do
			do
				local function fn61()
					local v75 = tbl18.Save.Peek()
					assert(v75, "Expected local save data")
					local index = v75.Index or {}
					local indexClaimedCategories = v75.IndexClaimedCategories or {}
					local n31 = 0

					for k, v76 in pairs(index) do
						if v76 == true and indexClaimedCategories[k] ~= true then
							n31 += 1
						end
					end

					return n31
				end

				fn56 = function()
					local v75 = fn61()
					if v75 <= 0 then
						return 0, "No claimable index rewards"
					end
					local response2, v76 = tbl19.AskRedeemAll:InvokeServer()
					if not response2 then
						return 0, v76 or "Index claim failed"
					end
					return v75, ("Claimed %d index rewards"):format(v75)
				end
			end
		end

		do
			do
				local function fn61(arg)
					if not arg then
						return 0
					end

					for _, v75 in ipairs({ "PendingOfflineMoney", "OfflineMoney", "AwayEarnings" }) do
						local v76 = arg[v75]
						if typeof(v76) == "number" and v76 > 0 then
							return v76
						end
						local v77 = "table"

						if type(v76) == "table" then
							for _, v78 in ipairs({ "Pending", "Amount", "Money", "Total", "Coins" }) do
								if typeof(v76[v78]) == "number" and v76[v78] > 0 then
									return v76[v78]
								end
							end
						end
					end

					return 0
				end

				local function fn62()
					local ok, result = pcall(function()
						return tbl19.AwayPendingCheck:InvokeServer()
					end)

					if ok then
						if result == false or result == nil then
							return false, nil
						end

						if result == true then
							return true, nil
						end

						if type(result) == "table" then
							for _, v75 in ipairs({ "Pending", "Amount", "Money", "Total", "Coins", "HasPending" }) do
								local v76 = result[v75]
								if v75 == "HasPending" and v76 == false then
									return false, nil
								end

								if typeof(v76) == "number" and v76 > 0 then
									return true, v76
								end
							end

							return true, nil
						end

						if typeof(result) == "number" then
							return result > 0, result
						end
					end

					local ok2, result2 = pcall(function()
						return tbl19.AwayFetchSummary:InvokeServer()
					end)

					if ok2 then
						if result2 == false or result2 == nil then
							return false, nil
						end

						if type(result2) == "table" then
							for _, v75 in ipairs({ "Pending", "Amount", "Money", "Total", "Coins" }) do
								local v76 = result2[v75]
								if typeof(v76) == "number" and v76 > 0 then
									return true, v76
								end
							end

							do
								return false, nil
							end
						end
					end

					return nil, nil
				end

				fn57 = function()
					if not tbl20.AutoClaimOffline then
						return false, "C.AutoClaimOffline disabled"
					end
					local v75 = tbl18.Save.Peek()
					if not v75 then
						return false, "No save data"
					end
					local v76 = fn61(v75)
					local v77, v78 = fn62()
					if v77 == false then
						return false, "No pending away earnings"
					end

					if v77 == nil and v76 <= 0 then
						return false, "No pending offline money"
					end

					if v77 == nil and v76 > 0 then
						return false, "Pending away earnings could not be confirmed"
					end

					local ok, result = pcall(function()
						return tbl19.AskCollectAway:InvokeServer()
					end)

					if not ok then
						return false, tostring(result)
					end

					if result ~= false then
						return true, ("Claimed away earnings (~%s)"):format(tostring(v78 or v76))
					end

					do
						return false, "Away earnings claim failed"
					end
				end
			end
		end

		tbl21.treadmillVisualsMuted = false
		tbl21.treadmillActiveName = nil
		tbl21.treadmillCamLocked = false
		tbl21.treadmillSavedCamCF = nil
		tbl21.treadmillListenerReady = false

		fn58 = function(...)
			if tbl20.Debug.Treadmill then
				warn("[AutoTM]", ...)
			end
		end

		do
			local moduleCache = {}
			local moduleMissAt = {}

			local function fn61(arg)
				local cached = moduleCache[arg]
				if cached ~= nil then
					return cached
				end

				local missAt = moduleMissAt[arg]
				if missAt and os.clock() - missAt < 10 then
					return nil
				end

				local localPlayer = tbl17.LocalPlayer
				local roots = { tbl17.RS }
				local playerScripts = localPlayer:FindFirstChild("PlayerScripts")
				local playerGui = localPlayer:FindFirstChild("PlayerGui")
				if playerScripts then table.insert(roots, 1, playerScripts) end
				if playerGui then table.insert(roots, playerGui) end

				for _, root in ipairs(roots) do
					local module = root:FindFirstChild(arg, true)
					if module and module:IsA("ModuleScript") then
						local ok, result = pcall(require, module)
						if ok and result ~= nil then
							moduleCache[arg] = result
							moduleMissAt[arg] = nil
							return result
						end
					end
				end

				moduleMissAt[arg] = os.clock()
				return nil
			end

			fn59 = function()
				if tbl21.treadmillVisualsMuted then
					return
				end
				tbl21.treadmillVisualsMuted = true

				pcall(function()
					if tbl18.SettingsCmds.Set then
						tbl18.SettingsCmds.Set("DisableVideos", true)
					end
				end)

				pcall(function()
					local speedGainPopup = tbl18.SpeedGainPopup

					speedGainPopup.Play = function(arg, arg2, arg3, arg4)
						local v75 = "function"

						if typeof(arg4) == v75 then
							task.defer(arg4)
						end
					end

					speedGainPopup.PlayWalk = speedGainPopup.Play
				end)

				pcall(function()
					local treadmillVideoController = tbl18.TreadmillVideoController

					treadmillVideoController.Start = function() end

					treadmillVideoController.Stop = function() end
				end)

				local TreadmillCharacterPresentationController = fn61("TreadmillCharacterPresentationController")

				if TreadmillCharacterPresentationController then
					pcall(function()
						TreadmillCharacterPresentationController.StopCameraTransparency()
					end)

					if typeof(TreadmillCharacterPresentationController.StartCameraTransparency) == "function" then
						TreadmillCharacterPresentationController.StartCameraTransparency = function() end
					end
				end

				local Visibility = fn61("Visibility")

				if Visibility and typeof(Visibility.Apply) == "function" then
					Visibility.Apply = function() end
				end

				fn58("visuals muted")
			end

			fn60 = function()
				pcall(function()
					tbl18.TreadmillVideoController.Stop()
				end)

				local TreadmillCharacterPresentationController = fn61("TreadmillCharacterPresentationController")

				if TreadmillCharacterPresentationController then
					pcall(function()
						TreadmillCharacterPresentationController.StopCameraTransparency()
					end)

					local v75 = "function"

					if typeof(TreadmillCharacterPresentationController.StartCameraTransparency) == v75 then
						TreadmillCharacterPresentationController.StartCameraTransparency = function() end
					end
				end
			end
		end
	end
	local fn61, fn62, fn63
	do
		do
			local function fn64()
				pcall(function()
					tbl17.RunService:UnbindFromRenderStep("StealAnEgg_TMCam")
				end)

				tbl21.treadmillCamLocked = false
				tbl21.treadmillSavedCamCF = nil
				local currentCamera = tbl17.Workspace.CurrentCamera

				if currentCamera then
					currentCamera.CameraType = Enum.CameraType.Custom
					local character = tbl17.LocalPlayer.Character
						and tbl17.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

					if character then
						do
							currentCamera.CameraSubject = character
						end
					end
				end
			end

			local function fn65()
				if not tbl20.TreadmillLockCamera then
					return
				end
				local currentCamera = tbl17.Workspace.CurrentCamera
				if not currentCamera then
					return
				end
				tbl21.treadmillSavedCamCF = currentCamera.CFrame
				currentCamera.CameraType = Enum.CameraType.Scriptable
				currentCamera.CFrame = tbl21.treadmillSavedCamCF

				pcall(function()
					tbl17.RunService:UnbindFromRenderStep("StealAnEgg_TMCam")
				end)

				tbl17.RunService:BindToRenderStep("StealAnEgg_TMCam", Enum.RenderPriority.Camera.Value + 10, function()
					local currentCamera2 = tbl17.Workspace.CurrentCamera

					if currentCamera2 and tbl21.treadmillSavedCamCF then
						currentCamera2.CameraType = Enum.CameraType.Scriptable
						currentCamera2.CFrame = tbl21.treadmillSavedCamCF
					end
				end)

				tbl21.treadmillCamLocked = true
			end

			fn61 = function()
				local v75 = tbl18.Save.Peek()
				if not v75 then
					return 0
				end
				return tbl18.TreadmillUtil.NormalizeSpeedPower(v75.SpeedPower)
			end

			fn62 = function()
				local n31 = math.clamp(tbl18.Save.Peek().TreadmillUpgradeLevel or 0, 1, #tbl21.sortedTreadmills)
				return tbl21.sortedTreadmills[n31] and tbl21.sortedTreadmills[n31].Name
			end

			local function fn66()
				if tbl21.treadmillListenerReady then
					return
				end
				tbl21.treadmillListenerReady = true

				tbl19.AssignedBeltShifted.OnClientEvent:Connect(function(treadmillActiveName)
					tbl21.treadmillActiveName = treadmillActiveName

					if treadmillActiveName ~= nil then
						fn60()
						task.defer(fn60)
						task.delay(0.05, fn60)
						task.delay(0.2, fn60)
					else
						fn64()
					end
				end)

				do
					return
				end
			end

			local function fn67()
				local ok, result, reason = pcall(function()
					return tbl19.AskWearStill:InvokeServer()
				end)
				if not ok then return false, tostring(result) end
				if reason == "Already using treadmill" then
					local collection = game:GetService("CollectionService")
					for index, model in ipairs(collection:GetTagged("ActiveTreadmill")) do
						if index > 32 then break end
						local id = model:GetAttribute("ActiveTreadmillId")
						if type(id) == "string" and id ~= "" then tbl21.treadmillActiveName = id break end
					end
					tbl21.treadmillActiveName = tbl21.treadmillActiveName or fn62()
					return true, reason
				end
				return result == true, reason or result
			end

			local function fn68()
				pcall(function()
					tbl19.AskDoffTreadmill:InvokeServer()
				end)

				fn64()
			end

			tbl21.LeaveTraining = fn68

			local function pauseFarm(reason)
				tbl21.TrainStarted = nil
				tbl21.FarmPausedReason = tostring(reason)
				fn64()
				fn30("Paused")
				fn29(tbl21.FarmPausedReason)
				return false, tbl21.FarmPausedReason
			end

			fn63 = function(duration, shouldStop, keepTraining)
				if tbl21.FarmPausedReason then return false, tbl21.FarmPausedReason end
				if not tbl20.AutoTreadmill then
					return false, "C.AutoTreadmill disabled"
				end
				fn30("Farm Mode")
				fn29("Training speed in a short session...")
				fn59()
				fn66()
				local v75 = fn62()
				if not v75 then
					return false, "No treadmill available"
				end
				local v76, v77 = fn42()
				local serverTimeNow = tbl17.Workspace:GetServerTimeNow()
				local v78 = "number"
				local n31 = serverTimeNow + (typeof(v76) == v78 and math.max(v76, 1) or 60) + 3
				local v79 = "cycle"
				fn58("farm until cycle", "tm", v75, "speed", fn61(), v79, v76, "via", v77)
				if tbl21.ApproachTreadmill then
					local reached, reason = tbl21.ApproachTreadmill()
					if not reached then fn64() return false, reason or "Treadmill route: unavailable" end
				end
				fn65()
				local v80, v81 = true, nil
				if tbl21.treadmillActiveName == nil then v80, v81 = fn67() end
				fn58("EQUIP_STATIC", v80, v81)
				if not v80 then
					if v81 == "Movement is not currently trusted" then fn64() return false, "Treadmill route: waiting for server movement recovery" end
					return pauseFarm(v81 or "Treadmill activation rejected")
				end
				fn60()
				local n32 = os.clock() + 8

				while tbl21.treadmillActiveName == nil and os.clock() < n32 do
					task.wait(0.1)
				end

				if tbl21.treadmillActiveName == nil then
					return pauseFarm("Treadmill activation was not confirmed")
				end
				local flag14
				local trainStarted = os.clock()
				tbl21.TrainStarted = trainStarted
				local trainDeadline = trainStarted + math.clamp(tonumber(duration) or 20, 5, 60)

				while true do
					if os.clock() >= trainDeadline or shouldStop and shouldStop() then break end
					local workspace_ = tbl17.Workspace
					flag14 = false

					if not (workspace_:GetServerTimeNow() < n31) then
						break
					else
						local value = select(1, fn42())

						if typeof(value) == "number" and typeof(v76) == "number" and value > v76 + 10 then
							fn58("phase rolled", v76, "->", value)
							flag14 = true
							break
						else
							local v82 = "number"

							if typeof(value) == v82 then
								local n33 = tbl17.Workspace:GetServerTimeNow() + value + 3

								if n33 > n31 then
									v76 = value
									n31 = n33
								else
									v76 = value
								end
							end

							if tbl21.treadmillActiveName == nil then
								fn65()
								local accepted, reason = fn67()
								if not accepted then
									if reason == "Movement is not currently trusted" then fn64() return false, "Treadmill route: waiting for server movement recovery" end
									return pauseFarm(reason or "Treadmill reactivation rejected")
								end
								fn60()
							else
								fn60()
							end

							local v83 = "number"
							local n33 = 1

							if typeof(value) == v83 then
								if value <= 2 then
									n33 = 0.03
								elseif value <= 5 then
									n33 = 0.05
								elseif value <= 15 then
									n33 = 0.15
								elseif value <= 30 then
									n33 = 0.35
								end
							end

							task.wait(n33)
						end
					end
				end

				tbl21.TrainStarted = nil
				if not (keepTraining and keepTraining()) then fn68() else fn29("Training speed while waiting for an eligible egg") end
				fn58("cycle wait done, speed", fn61(), "rolled", flag14)
				return true, flag14 and "Cycle rolled" or "Deadline", flag14, os.clock() - trainStarted
			end
		end
	end
	local fn64, fn65
	do
		fn64 = function()
			if #stealAnEgg.StealEggs == 0 then
				return 0, "No eggs configured in StealEggs"
			end

			do
				fn30("Steal Mode")
				fn29("Steal ASAP after cycle...")
				local stealAfterCycleMaxWait = tbl20.StealAfterCycleMaxWait or 30
				local n31 = os.clock() + stealAfterCycleMaxWait
				fn58("steal ASAP after cycle, wait up to", stealAfterCycleMaxWait, "s")
				while os.clock() < n31 do
					if fn43() and fn45() then
						return fn51()
					end
					task.wait(0.05)
				end
				if fn43() and fn45() then
					return fn51()
				end
				return 0, "No matching eggs right after cycle"
			end
		end

		fn65 = function()
			if tbl21.FarmPausedReason then return end
			fn30("Maintenance")
			local function runStep(taskName, tag, callback, upgrade)
				fn29(taskName)
				local ok, result, reason = pcall(callback)
				if not ok then
					warn(tag, "failed:", result)
				elseif upgrade then
					warn(tag, "Upgraded", result, "times:", reason)
				else
					warn(tag, result, reason)
				end
				task.wait(0.1)
			end
			runStep("Equip best trail", "[Trail]", fn35)
			runStep("Upgrade treadmill", "[Treadmill]", function() return fn37(1) end, true)
			task.wait()
			if not tbl21.CanUpgradeTreadmill or not tbl21.CanUpgradeTreadmill() then
				runStep("Upgrade base", "[BaseUpgrade]", function() return fn36(1) end, true)
			end
			runStep("Sell pets", "[Sell]", fn39)
			runStep("Hatch eggs", "[HatchEggs]", fn53)
			runStep("Place eggs", "[PlaceEggs]", fn55)
			runStep("Claim index rewards", "[Index]", fn56)
			runStep("Claim offline money", "[Offline]", fn57)
			fn29("Idle")
		end

		do
			local function fn66()
				local zoneStamp, zoneCount, zoneMatch = -math.huge, 0, 0
				task.spawn(function()
					while task.wait(1) do
						if tbl21.ui.UI then
							local startingTime = tbl21.ui.StartingTime
							fn28(tbl21.ui.UI.SessionTime, (tbl21.ui.UI.Compact and "" or "Session Time: ") .. fn32(os.time() - startingTime))
							local treadmillUpgradeLevel = tbl18.Save.Peek()
							local money = treadmillUpgradeLevel and treadmillUpgradeLevel.Money or 0
							local baseUpgradeLevel = treadmillUpgradeLevel and treadmillUpgradeLevel.BaseUpgradeLevel
								or 0
							treadmillUpgradeLevel = treadmillUpgradeLevel
									and treadmillUpgradeLevel.TreadmillUpgradeLevel
								or 0
							local v75 = fn61()
							local str7 = fn62() or "-"
							local v76, v77 = fn42()
							local flag14, v78 = fn43()
							if os.clock() - zoneStamp >= 4 then
								zoneStamp = os.clock()
								local eggs = fn41()
								zoneCount = #eggs
								zoneMatch = fn46(eggs)
							end
							local n31 = zoneCount
							local v79 = zoneMatch
							local n32 = #stealAnEgg.StealEggs
							local str8 = "?"

							if typeof(v76) == "number" then
								str8 = fn32(v76)
							end

							local str9 = flag14 and "OK"

							if not str9 then
								str9 = tostring(v78 or "blocked")
							end

							if flag14 then
								local v80 = "number"
								flag14 = typeof(v78) == v80
							end

							if flag14 then
								str9 = ("OK (%.0fs)"):format(v78)
							end

							local str10 = string.format(
								[[Money:        %s
Plot:         %d / %d
Treadmill:    %d / %d (%s)
Speed:        %s
Cycle left:   %s (%s)
Steal ready:  %s
Zone eggs:    %d
Steal match:  %d (%d rules)]],
								fn31(money),
								baseUpgradeLevel,
								stealAnEgg.MaxPlotLevel,
								treadmillUpgradeLevel,
								stealAnEgg.MaxTreadmillLevel,
								str7,
								fn31(v75),
								str8,
								tostring(v77 or "-"),
								str9,
								n31,
								v79,
								n32
							)

							if tbl21.Halloween and tbl21.Halloween.State.OwnsStep then
								str10 = tbl21.Halloween.Info(fn31)
							end
							if tbl21.ui.UI.Compact then
								local stats = tbl21.ui.UI.Stats
								fn28(stats.Cash, "$" .. fn31(money))
								fn28(stats.Speed, fn31(v75))
								fn28(stats.Treadmill, ("%d / %d"):format(treadmillUpgradeLevel, stealAnEgg.MaxTreadmillLevel))
								fn28(stats.Plot, ("%d / %d"):format(baseUpgradeLevel, stealAnEgg.MaxPlotLevel))
								fn28(stats.Cycle, str8)
								fn28(stats.Targets, ("%d / %d"):format(v79, n31))
								if tbl21.Halloween and tbl21.Halloween.State.OwnsStep then
									str10 = str10:gsub("\n", "  |  ")
								else
									local farm = environment.Config and environment.Config.Farm or {}
									local state = tbl21.FarmPlanner and tbl21.FarmPlanner.State
									local credit = state and state.TrainCredit or 0
									if tbl21.TrainStarted then credit += math.max(0, os.clock() - tbl21.TrainStarted) end
									str10 = ("Train %ds / %ds  |  Egg >= %s / s  |  Goal %s"):format(math.floor(credit), tonumber(farm["Min Train Seconds"]) or 0,
										tostring(farm["Min Egg Income"] or 0), state and state.SpeedGoal and fn31(state.SpeedGoal) or "--")
								end
							end
							fn28(tbl21.ui.UI.Info, str10)
							fn28(tbl21.ui.UI.CurrentZone, tbl21.ui.Mode)
							fn28(tbl21.ui.UI.LastTask, "Task: " .. tbl21.ui.CurrentTask)
						end
					end
				end)
			end

			fn34()
			fn33()
			fn30("Steal An Egg")
			fn29("Starting loop...")
			fn66()
		end
	end
	do
		local createFarmPlanner = function(context)
			local now = context.Clock or os.clock
			local state: { [string]: any } = {
				Active = true,
				ManagedEggs = context.ManagedEggs or {},
				StealsSinceTrain = 0,
				TrainCredit = 0,
				FailedTargets = {},
				NextMaintenance = 0,
				NextUpgrade = 0,
				NextPlace = 0,
				SpeedGoal = nil,
				Action = "Starting balanced farm",
			}
			local planner = { State = state, Game = context.Game or game }
			local function config()
				local value = context.GetConfig()
				return type(value) == "table" and value or {}
			end
			local function halt(reason)
				state.HaltedReason = tostring(reason)
				state.Action = "Paused: " .. state.HaltedReason
				if context.Status then
					context.Status("Paused", state.Action)
				end
				return true
			end
			local function budget(name, fallback, minimum, maximum)
				local value = tonumber(config()[name]) or fallback
				if value ~= value or value == math.huge or value == -math.huge then
					value = fallback
				end
				return math.clamp(value, minimum, maximum)
			end
			function planner.Automatic()
				return #context.GetStealRules() == 0 and config()["Auto Steal Eggs"] ~= false
			end
			local function minimumIncome()
				local value = config()["Min Egg Income"]
				if value == nil then
					return 0
				end
				local numeric = tonumber(value)
				if not numeric and type(value) == "string" then
					local amount, suffix = string.upper(value):match("^%s*([%d%.]+)%s*([KMBT])%s*$")
					local scale = ({ K = 1e3, M = 1e6, B = 1e9, T = 1e12 })[suffix]
					numeric = amount and scale and tonumber(amount) and tonumber(amount) * scale or nil
				end
				if not numeric or numeric ~= numeric or numeric < 0 or numeric == math.huge then
					return nil
				end
				return numeric
			end
			function planner.Qualifies(egg)
				local minimum = minimumIncome()
				if not minimum then
					return false
				end
				if minimum == 0 then
					return true
				end
				local income = context.EggIncome and context.EggIncome(egg)
				return type(income) == "number" and income == income and income < math.huge and income >= minimum
			end
			function planner.Accessible(egg)
				if not egg.Position or not egg.Uid then
					return false
				end
				local required = context.RequiredSpeed(egg)
				if type(required) ~= "number" or required ~= required or required < 0 then
					return not planner.Automatic()
				end
				local speed = context.GetSave().SpeedPower or 0
				local margin = budget("Speed Margin", 1.05, 1, 2)
				if speed < required * margin then
					local goal = required * margin
					if not state.SpeedGoal or goal < state.SpeedGoal then
						state.SpeedGoal = goal
					end
					return false
				end
				return true
			end
			function planner.Ignore(egg)
				if egg.Rarity ~= "Secret" then
					return false
				end
				local ignore = config()["Ignore Secret"]
				if type(ignore) ~= "table" then
					return false
				end
				for key, value in pairs(ignore) do
					local name = type(key) == "string" and value == true and key or value
					if name == egg.Name or name == egg.AssetCategory or name == egg.AreaId then
						return true
					end
				end
				return false
			end
			function planner.Choose(eggs, processed, targetUid)
				local best, bestScore
				for index, egg in ipairs(eggs) do
					if index % 16 == 0 and context.Yield then
						context.Yield()
					end
					if
						egg.Uid
						and not (state.FailedTargets[egg.Uid] and state.FailedTargets[egg.Uid] > now())
						and not (processed and processed[egg.Uid])
						and (not targetUid or egg.Uid == targetUid)
						and planner.Qualifies(egg)
						and context.Matches(egg)
					then
						local score = context.Score(egg)
						if type(score) == "number" and score == score and (not bestScore or score > bestScore) then
							best, bestScore = egg, score
						end
					end
				end
				return best
			end
			function planner.RegisterEgg(uid)
				if type(uid) == "string" then
					state.ManagedEggs[uid] = true
				end
			end
			function planner.PendingCount()
				local inventory = context.GetSave().EggInventory or {}
				local placed = context.GetPlaced()
				local count = 0
				for uid in pairs(state.ManagedEggs) do
					if inventory[uid] == nil then
						state.ManagedEggs[uid] = nil
					elseif not (placed[uid] and placed[uid].Placement) then
						count += 1
					end
				end
				return count
			end
			function planner.AutoPlace(uid)
				return config()["Auto Place Eggs"] ~= false and state.ManagedEggs[uid] == true
			end
			local function maintain()
				state.Action = "Upgrade, place eggs and hatch ready eggs"
				if
					context.LeaveTraining
					and (
						context.CanUpgradeTreadmill()
						or planner.PendingCount() > 0
						or context.HasReadyEggs and context.HasReadyEggs()
					)
				then
					context.LeaveTraining()
				end
				context.Maintain()
				state.NextMaintenance = now() + 15
			end
			local function train()
				local seconds = budget("Train Seconds", 20, 5, 60)
				local started = now()
				local minimumTrain = budget("Min Train Seconds", 0, 0, 600)
				local nextCheck = started + 5
				local function shouldStop()
					if not state.Active or state.HaltedReason then
						return true
					end
					if now() < nextCheck then
						return false
					end
					nextCheck = now() + 2
					if context.CanUpgradeTreadmill() then
						return true
					end
					if state.TrainCredit + now() - started < minimumTrain then
						return false
					end
					if now() < (state.NextStealAttempt or 0) then
						return false
					end
					if now() - started >= 8 and context.CycleReady() and planner.Choose(context.GetEggs()) then
						return true
					end
					return false
				end
				local function keepTraining()
					if not state.Active or state.HaltedReason or context.CanUpgradeTreadmill() then
						return false
					end
					if planner.PendingCount() > 0 or context.HasReadyEggs and context.HasReadyEggs() then
						return false
					end
					if now() < (state.NextStealAttempt or 0) then
						return true
					end
					if state.TrainCredit + now() - started < minimumTrain then
						return true
					end
					return not (context.CycleReady() and planner.Choose(context.GetEggs()))
				end
				state.Action = ("Training for up to %.0fs, then checking eggs and upgrades"):format(seconds)
				local ok, reason, trained = context.Train(seconds, shouldStop, keepTraining)
				if ok ~= false then
					state.TrainCredit += math.max(0, type(trained) == "number" and trained or now() - started)
				end
				if context.Failure and context.Failure() then
					return halt(context.Failure())
				end
				if ok == false then
					if type(reason) == "string" and reason:find("Treadmill route:", 1, true) == 1 then
						state.NextTrainAttempt = now() + (reason == "Treadmill route: Route progress" and 0 or 5)
						state.Action = reason
						if context.Status then
							context.Status("Farm Mode", "Replanning the route to the treadmill")
						end
						return true
					end
					return halt(reason or "Treadmill training failed")
				end
				state.StealsSinceTrain = 0
				state.NextUpgrade = 0
				return true
			end
			local function step()
				if not state.Active then
					return false
				end
				if not minimumIncome() then
					return halt("Invalid Min Egg Income config")
				end
				for uid, expires in pairs(state.FailedTargets) do
					if expires <= now() then
						state.FailedTargets[uid] = nil
					end
				end
				if state.HaltedReason then
					return halt(state.HaltedReason)
				end
				if context.Failure and context.Failure() then
					return halt(context.Failure())
				end
				if now() < (state.NextTrainAttempt or 0) then
					return true
				end
				if now() >= state.NextMaintenance then
					maintain()
					return true
				end
				if now() >= state.NextUpgrade and context.CanUpgradeTreadmill() then
					state.Action = "Upgrading the treadmill before the next train session"
					if context.LeaveTraining then
						context.LeaveTraining()
					end
					local count, reason = context.UpgradeTreadmill()
					if count == 0 then
						return halt(reason or "Treadmill upgrade was not confirmed")
					end
					state.NextUpgrade = now() + 5
					return true
				end
				local pending = planner.PendingCount()
				if pending > 0 and now() >= state.NextPlace then
					state.Action = "Placing stolen eggs and hatching ready eggs"
					if context.LeaveTraining then
						context.LeaveTraining()
					end
					context.PlaceAndHatch()
					state.NextPlace = now() + 10
					return true
				end
				local batch = math.floor(budget("Steal Batch Size", 2, 1, 5))
				if
					pending < 2
					and state.StealsSinceTrain < batch
					and state.TrainCredit >= budget("Min Train Seconds", 0, 0, 600)
					and now() >= (state.NextStealAttempt or 0)
					and not context.CanUpgradeTreadmill()
					and context.CycleReady()
				then
					state.SpeedGoal = nil
					local target = planner.Choose(context.GetEggs())
					if target then
						state.Action = "Stealing " .. tostring(target.Name or target.AssetCategory)
						if context.LeaveTraining then
							context.LeaveTraining()
						end
						local stolen, reason = context.Steal(1, target.Uid)
						if stolen == 0 and reason == "Stolen 0 eggs" then
							return train()
						end
						if
							stolen == 0
							and (
								reason == "Carried egg was not confirmed in inventory"
								or reason == "Movement is not currently trusted"
							)
						then
							state.FailedTargets[target.Uid] = now() + 45
							if reason == "Movement is not currently trusted" then
								state.NextStealAttempt = now() + 60
							end
							state.LastFailure = reason
							state.TrainCredit = 0
							state.Action = "Egg delivery not confirmed; training before the next target"
							if context.Status then
								context.Status("Farm Mode", state.Action)
							end
							return train()
						end
						if type(stolen) ~= "number" or stolen < 1 then
							return halt(reason or "The egg was not acquired")
						end
						state.StealsSinceTrain += stolen
						state.TrainCredit = 0
						context.PlaceAndHatch()
						state.NextPlace = now() + 10
						state.NextMaintenance = math.min(state.NextMaintenance, now() + 5)
						return true
					end
				end
				return train()
			end
			function planner.Step()
				local ok, result = pcall(step)
				if not ok then
					return halt(result)
				end
				return result
			end
			function planner.Stop()
				state.Active = false
			end
			return planner
		end
		local previous = environment.__SkiderSaeFarm
		local managed = {}
		if type(previous) == "table" and previous.Game == game then
			if previous.State then managed = previous.State.ManagedEggs or {} end
			if type(previous.Stop) == "function" then previous.Stop() end
		end
		local requiredCache = {}
		local function requiredSpeed(egg)
			local mainWorld = tbl17.Workspace:FindFirstChild("World")
			local areas = mainWorld and mainWorld:FindFirstChild("Areas")
			local guards = areas and areas:FindFirstChild("GuardAreas")
			local area = guards and guards:FindFirstChild(tostring(egg.AreaId))
			if not area then return nil end
			local published = area:GetAttribute("GuardEscapeSpeeds")
			if typeof(published) == "Vector2" then return published.X end
			local cached = requiredCache[area]
			if cached and os.clock() < cached.Expires then return cached.Value end
			if not tbl21.GuardEscapeRequirement then
				task.wait()
				tbl21.GuardEscapeRequirement = require(tbl17.RS.Shared.Modules.GuardAreas.GuardEscapeRequirement)
			end
			local guard = area:FindFirstChild("Guard")
			local root = guard and guard:FindFirstChild("HumanoidRootPart")
			local line = areas:FindFirstChild("SeparationLine")
			if not root or not line then return nil end
			local ok, value = pcall(tbl21.GuardEscapeRequirement.ResolveSpeedPower, area, root.Position, line)
			if not ok or type(value) ~= "number" then return nil end
			requiredCache[area] = {Value = value, Expires = os.clock() + 5}
			return value
		end
		local function canUpgrade()
			local save = tbl18.Save.Peek()
			if not save then return false end
			local level = save.TreadmillUpgradeLevel or 0
			local nextTier = tbl21.sortedTreadmills[level + 1]
			return level < stealAnEgg.MaxTreadmillLevel and nextTier ~= nil and (save.Money or 0) >= nextTier.Price
		end
		tbl21.CanUpgradeTreadmill = canUpgrade
		local createNavigator = function(context)
			local player = context.Player
			local now = context.Clock or os.clock
			local waitFor = context.Wait or task.wait
			local navigator = { Stopped = false }
			local current
			local function flat(a, b)
				return Vector3.new(a.X - b.X, 0, a.Z - b.Z).Magnitude
			end
			function navigator.Cancel()
				if current then
					current.Cancel()
				end
			end
			function navigator.Stop()
				navigator.Stopped = true
				navigator.Cancel()
			end
			function navigator.Go(destination, radius, predicate, seconds)
				navigator.Cancel()
				if navigator.Stopped then
					return false, "Cancelled"
				end
				local character = player.Character
				local root = character and character:FindFirstChild("HumanoidRootPart")
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if not root or not humanoid or humanoid.Health <= 0 then
					return false, "Character unavailable"
				end
				local function arrived()
					return predicate and predicate() or (root.Position - destination).Magnitude <= (radius or 5)
				end
				if arrived() then
					return true
				end
				local pathfinding = context.Pathfinding or game:GetService("PathfindingService")
				local path =
					pathfinding:CreatePath({ AgentRadius = 2, AgentHeight = 5, AgentCanJump = true, WaypointSpacing = 8 })
				local computed = pcall(path.ComputeAsync, path, root.Position, destination)
				local points = computed and path.Status == Enum.PathStatus.Success and path:GetWaypoints() or nil
				if path.Destroy then
					path:Destroy()
				end
				if not points or #points == 0 then
					return false, "No walkable path"
				end
				local partial = #points > 256
				if partial then
					points = table.move(points, 1, 256, 1, {})
				end
				if not partial and flat(points[#points].Position, destination) > math.max(radius or 5, 12) then
					return false, "Destination is not reachable"
				end
				local compact = {}
				for index, point in ipairs(points) do
					local previous, following = compact[#compact], points[index + 1]
					local redundant = false
					if
						previous
						and following
						and point.Action ~= Enum.PathWaypointAction.Jump
						and following.Action ~= Enum.PathWaypointAction.Jump
					then
						local a, b = point.Position - previous.Position, following.Position - point.Position
						redundant = a.Magnitude > 0.1 and b.Magnitude > 0.1 and a.Unit:Dot(b.Unit) > 0.995
					end
					if not redundant then
						table.insert(compact, point)
					end
				end
				local reached = false
				local connection = humanoid.MoveToFinished
					and humanoid.MoveToFinished:Connect(function(value)
						reached = value == true
					end)
				local lease: { [string]: any } = { Cancelled = false }
				current = lease
				function lease.Cancel()
					if lease.Cancelled then
						return
					end
					lease.Cancelled = true
					if connection then
						connection:Disconnect()
						connection = nil
					end
					if current ~= lease then
						return
					end
					current = nil
					if
						lease.LastPoint
						and player.Character == character
						and root.Parent
						and humanoid.Parent
						and typeof(humanoid.WalkToPoint) == "Vector3"
						and (humanoid.WalkToPoint - lease.LastPoint).Magnitude < 0.05
					then
						humanoid:MoveTo(root.Position)
						humanoid:Move(Vector3.zero, false)
					end
				end
				local deadline = now() + (seconds or 35)
				local tolerance = math.clamp((humanoid.WalkSpeed or 16) * 0.08, 3, 8)
				local function walk()
					for _, point in ipairs(compact) do
						if navigator.Stopped or lease.Cancelled or context.IsActive and not context.IsActive() then
							return false, "Cancelled"
						end
						if player.Character ~= character or humanoid.Health <= 0 then
							return false, "Character changed"
						end
						if arrived() then
							return true
						end
						if point.Action == Enum.PathWaypointAction.Jump then
							humanoid.Jump = true
						end
						reached = false
						lease.LastPoint = point.Position
						humanoid:MoveTo(point.Position)
						local pointDeadline = math.min(
							deadline,
							now()
								+ math.max(
									5,
									flat(root.Position, point.Position) / math.max(humanoid.WalkSpeed or 16, 1) * 2 + 2
								)
						)
						while
							flat(root.Position, point.Position) > 3
							and not (reached and flat(root.Position, point.Position) <= tolerance)
						do
							if arrived() then
								return true
							end
							if navigator.Stopped or lease.Cancelled or context.IsActive and not context.IsActive() then
								return false, "Cancelled"
							end
							if player.Character ~= character or humanoid.Health <= 0 then
								return false, "Character changed"
							end
							if now() >= pointDeadline then
								return false, "Route timed out"
							end
							waitFor(0.05)
						end
						waitFor()
					end
					return arrived(), partial and "Route progress" or "Destination not reached"
				end
				local ok, result, reason = pcall(walk)
				lease.Cancel()
				if not ok then
					return false, tostring(result)
				end
				return result, reason
			end
			return navigator
		end
		tbl21.ApproachTreadmill = function()
			if tbl21.treadmillActiveName ~= nil then return true end
			if not tbl21.NativePlotState then task.wait() tbl21.NativePlotState = require(tbl17.RS.Client.PlotState) end
			local slot = tbl21.NativePlotState.ResolveLocalSlot()
			local plots = tbl17.Workspace:FindFirstChild("Plots")
			local plot = slot and plots and plots:FindFirstChild(tostring(slot))
			local bottom = plot and plot:FindFirstChild("TreadmillBottom")
			if not bottom or not bottom:IsA("BasePart") then return false, "Treadmill route: waiting for the own pad" end
			local character = tbl17.LocalPlayer.Character
			local root = character and character:FindFirstChild("HumanoidRootPart")
			if not root then return false, "Treadmill route: waiting for character" end
			local ray = RaycastParams.new()
			ray.FilterType = Enum.RaycastFilterType.Include
			ray.FilterDescendantsInstances = {bottom}
			local function reached()
				return tbl21.treadmillActiveName ~= nil or tbl17.Workspace:Raycast(root.Position, Vector3.new(0,-8,0),ray) ~= nil
			end
			if reached() then return true end
			fn30("Farm Mode")
			fn29("Walking to the own treadmill pad")
			local navigator = createNavigator({Player=tbl17.LocalPlayer,IsActive=function() return not tbl21.FarmPlanner or tbl21.FarmPlanner.State.Active end})
			tbl21.TreadmillNavigation = navigator
			local target = bottom.CFrame:PointToWorldSpace(Vector3.new(0,bottom.Size.Y/2+3,0))
			local arrived, reason = navigator.Go(target, 5, reached, 35)
			tbl21.TreadmillNavigation = nil
			if not arrived then return false, "Treadmill route: " .. tostring(reason) end
			task.wait(0.3)
			return true
		end
		tbl21.FarmPlanner = createFarmPlanner({
			Game = game,
			ManagedEggs = managed,
			GetConfig = function()
				local current = environment.Config
				return type(current) == "table" and current.Farm or {}
			end,
			GetSave = function() return tbl18.Save.Peek() or {} end,
			GetStealRules = function() return stealAnEgg.StealEggs end,
			GetPlaced = function() return tbl18.EggCmds.GetOwnerRuntimeRecords(tbl17.LocalPlayer.UserId) or {} end,
			GetEggs = fn41,
			Matches = tbl21.MatchesStealEgg,
			RequiredSpeed = requiredSpeed,
			EggIncome = function(egg)
				local asset = fn27(tbl18.AssetsDir)[egg.AssetCategory]
				return asset and tonumber(asset.EarningRate) or nil
			end,
			Score = function(egg)
				local asset = fn27(tbl18.AssetsDir)[egg.AssetCategory]
				local rate = asset and tonumber(asset.EarningRate) or 1
				local rank = asset and asset.Rarity and tonumber(asset.Rarity.Rank) or 0
				local root = fn47()
				local distance = root and (egg.Position - root.Position).Magnitude or 100
				return math.log(1 + math.max(rate, 0) * math.max(tonumber(egg.AssetScale) or 1, 0.01)) * 10 + rank - math.log(1 + distance) * 2
			end,
			CanUpgradeTreadmill = canUpgrade,
			UpgradeTreadmill = function() return fn37(1) end,
			CycleReady = fn43,
			Maintain = fn65,
			PlaceAndHatch = function()
				fn53()
				task.wait()
				fn55()
				task.wait()
				fn53()
			end,
			LeaveTraining = function() if tbl21.treadmillActiveName ~= nil then tbl21.LeaveTraining() end end,
			HasReadyEggs = function()
				if type(tbl18.EggState.IsReadyToHatch) ~= "function" then return false end
				local count = 0
				for uid, record in pairs(tbl18.EggCmds.GetOwnerRuntimeRecords(tbl17.LocalPlayer.UserId) or {}) do
					count += 1
					if count % 16 == 0 then task.wait() end
					if record.Placement then
						local ok, ready = pcall(tbl18.EggState.IsReadyToHatch, uid)
						if ok and ready then return true end
					end
				end
				return false
			end,
			Train = function(seconds, stop, keep)
				local ok, reason, _, trained = fn63(seconds, stop, keep)
				return ok, reason, trained
			end,
			Steal = fn51,
			Failure = function() return tbl21.FarmPausedReason end,
			Status = function(mode, message) fn30(mode) fn29(message) end,
			Yield = task.wait,
		})
		environment.__SkiderSaeFarm = tbl21.FarmPlanner
	end
	do
		local createHalloween = function(context)
			local player = context.Player
			local world = context.World
			local storage = context.Storage
			local now = context.Clock or os.clock
			local waitFor = context.Wait or task.wait
			local state: { [string]: any } = {
				Build = "halloween-v742-r11",
				Active = true,
				Mode = "Idle",
				Task = "Waiting for Halloween config",
				Blocked = {},
				Requests = {},
				Modules = {},
				ModuleTimes = {},
				Modes = {},
				NextShotId = 0,
				LastShot = -math.huge,
				LastAttack = -math.huge,
				LastPurchase = -math.huge,
				LastJoin = -math.huge,
				CompletedTrips = 0,
				PurchasedEggs = 0,
				NextFarmVisit = 0,
			}
			local controller = { State = state, Game = context.Game or game }
			local function config()
				local value = context.GetConfig()
				return type(value) == "table" and value or {}
			end
			local function enabled(mode)
				return state.Active and state.HaltedReason == nil and config()[mode] == true and state.Blocked[mode] == nil
			end
			local function status(mode, message)
				if state.HaltedReason and mode ~= "Paused" and string.sub(message, 1, 7) ~= "Paused:" then
					return
				end
				state.Mode = mode
				state.Task = message
				if context.SetMode then
					context.SetMode("Halloween / " .. mode)
				end
				if context.SetTask then
					context.SetTask(message)
				end
			end
			local function pause(mode, reason)
				state.Blocked[mode] = tostring(reason)
				state.HaltedReason = mode .. ": " .. tostring(reason)
				status(mode, "Paused: " .. tostring(reason))
				return true
			end
			local function module(path)
				if state.Modules[path] then
					return state.Modules[path]
				end
				local current = storage
				for name in string.gmatch(path, "[^/]+") do
					current = current and current:FindFirstChild(name)
					if not current then
						return nil
					end
				end
				if not current:IsA("ModuleScript") then
					return nil
				end
				waitFor()
				local started = now()
				local ok, result = pcall(context.Require or require, current)
				state.ModuleTimes[path] = now() - started
				if ok and type(result) == "table" then
					state.Modules[path] = result
					return result
				end
				return nil
			end
			local function connected()
				if context.Connected then
					return context.Connected()
				end
				local network = game:GetService("NetworkClient")
				return player.Parent ~= nil and network:FindFirstChildOfClass("ClientReplicator") ~= nil
			end
			local function avatar()
				local character = player.Character
				local root = character and character:FindFirstChild("HumanoidRootPart")
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if not root or not root:IsA("BasePart") or not humanoid or humanoid.Health <= 0 then
					return nil
				end
				return root, humanoid, character
			end
			local function map()
				return world:FindFirstChild("HalloweenDimension")
			end
			local function inside()
				return player:GetAttribute("InHalloweenDimension") == true
			end
			local function flag(path, name, fallback)
				local flags = module(path)
				local value = flags and flags[name]
				if type(value) == "table" and type(value.Get) == "function" then
					local ok, result = pcall(value.Get, value)
					if ok then
						return result
					end
				end
				return fallback
			end
			local function remote(group, name)
				local remotes = module("Shared/Remotes")
				return remotes and remotes[group] and remotes[group][name]
			end
			local function invoke(mode, endpoint, ...)
				if not endpoint then
					return false, "Required remote is missing"
				end
				if not enabled(mode) or not connected() then
					return false, "Cancelled"
				end
				if state.Requests[endpoint] then
					return false, "A previous request is still pending"
				end
				local arguments = table.pack(...)
				local pending = { Done = false }
				state.Requests[endpoint] = pending
				task.defer(function()
					if not enabled(mode) or not connected() then
						pending.Result = table.pack(false, "Cancelled")
						pending.Done = true
						return
					end
					pending.Result = table.pack(pcall(function()
						return endpoint:InvokeServer(table.unpack(arguments, 1, arguments.n))
					end))
					pending.Done = true
				end)
				local deadline = now() + 10
				while not pending.Done and enabled(mode) and connected() and now() < deadline do
					waitFor(0.1)
				end
				if not pending.Done then
					return false, "Request was not confirmed; automatic retry stopped"
				end
				state.Requests[endpoint] = nil
				local result = pending.Result
				if not result[1] then
					return false, tostring(result[2])
				end
				return true, table.unpack(result, 2, result.n)
			end
			local function confirm(mode, predicate, seconds)
				local deadline = now() + (seconds or 6)
				repeat
					if predicate() then
						return true
					end
					if not enabled(mode) or not connected() then
						return false
					end
					waitFor(0.1)
				until now() >= deadline
				return false
			end
			local function position(instance)
				if not instance then
					return nil
				end
				if instance:IsA("BasePart") then
					return instance.Position
				end
				if instance:IsA("Attachment") then
					return instance.WorldPosition
				end
				if instance:IsA("Model") then
					return instance:GetPivot().Position
				end
				return nil
			end
			local function flatDistance(a, b)
				return (Vector3.new(a.X - b.X, 0, a.Z - b.Z)).Magnitude
			end
			local function move(mode, target, radius)
				local root, humanoid, character = avatar()
				if not root then
					return false, "Character unavailable"
				end
				if not enabled(mode) or not connected() then
					return false, "Cancelled"
				end
				local destination = typeof(target) == "Vector3" and target or position(target)
				if not destination then
					return false, "Destination missing"
				end
				radius = radius or 5
				if (root.Position - destination).Magnitude <= radius then
					return true
				end
				local delta = destination - root.Position
				local intermediate = delta.Magnitude > 400 and root.Position + delta.Unit * 400 or destination
				local waypoints
				local prepared = state.EscapeRoute
				if
					prepared
					and prepared.Character == character
					and now() < prepared.Expires
					and (root.Position - prepared.Start).Magnitude < 15
					and (destination - prepared.Destination).Magnitude < 15
				then
					destination = prepared.Destination
					waypoints = prepared.Waypoints
					state.EscapeRoute = nil
				else
					local pathfinding = context.Pathfinding or game:GetService("PathfindingService")
					local path =
						pathfinding:CreatePath({ AgentRadius = 2, AgentHeight = 5, AgentCanJump = true, WaypointSpacing = 12 })
					local ok = pcall(path.ComputeAsync, path, root.Position, intermediate)
					if not ok or path.Status ~= Enum.PathStatus.Success then
						if path.Destroy then
							path:Destroy()
						end
						return false, "No walkable path"
					end
					waypoints = path:GetWaypoints()
					if path.Destroy then
						path:Destroy()
					end
				end
				if #waypoints > 256 then
					return false, "Path exceeds the navigation budget"
				end
				local compact = {}
				for index, waypoint in ipairs(waypoints) do
					local previous = compact[#compact]
					local following = waypoints[index + 1]
					local redundant = false
					if
						previous
						and following
						and waypoint.Action ~= Enum.PathWaypointAction.Jump
						and following.Action ~= Enum.PathWaypointAction.Jump
					then
						local incoming = waypoint.Position - previous.Position
						local outgoing = following.Position - waypoint.Position
						redundant = incoming.Magnitude > 0.1
							and outgoing.Magnitude > 0.1
							and incoming.Unit:Dot(outgoing.Unit) > 0.995
					end
					if not redundant then
						table.insert(compact, waypoint)
					end
				end
				waypoints = compact
				local started = now()
				local initial = root.Position
				local wasCarrying = player:GetAttribute("HalloweenCarrying") == true
				local wasInside = inside()
				local wasArena = player:GetAttribute("InPumpkinArena")
				local wasRace = player:GetAttribute("RaceId")
				local previousPosition = root.Position
				local function changedScene()
					local changed = inside() ~= wasInside
						or player:GetAttribute("InPumpkinArena") ~= wasArena
						or player:GetAttribute("RaceId") ~= wasRace
						or (root.Position - previousPosition).Magnitude > 400
					previousPosition = root.Position
					return changed
				end
				local arrivalTolerance = math.clamp((humanoid.WalkSpeed or 16) * 0.08, 3, 8)
				local waypointReached = false
				local connection = humanoid.MoveToFinished
					and humanoid.MoveToFinished:Connect(function(reached)
						waypointReached = reached == true
					end)
				local navigation: { [string]: any } = { Cancelled = false }
				function navigation.Cancel()
					if navigation.Cancelled then
						return
					end
					navigation.Cancelled = true
					if connection then
						connection:Disconnect()
						connection = nil
					end
					if state.Navigation ~= navigation then
						return
					end
					state.Navigation = nil
					local point = navigation.LastPoint
					if
						point
						and root.Parent
						and humanoid.Parent
						and player.Character == character
						and typeof(humanoid.WalkToPoint) == "Vector3"
						and (humanoid.WalkToPoint - point).Magnitude < 0.05
					then
						humanoid:MoveTo(root.Position)
						humanoid:Move(Vector3.zero, false)
					end
				end
				if state.Navigation then
					state.Navigation.Cancel()
				end
				state.Navigation = navigation
				local function followPath()
					for _, waypoint in ipairs(waypoints) do
						waypointReached = false
						if wasCarrying and player:GetAttribute("HalloweenCarrying") ~= true then
							return false, "Carry changed"
						end
						if changedScene() then
							return false, "Transition"
						end
						if not enabled(mode) or not connected() or player.Character ~= character then
							if humanoid.Parent then
								humanoid:Move(Vector3.zero, false)
							end
							return false, "Cancelled"
						end
						if (root.Position - destination).Magnitude <= radius then
							return true
						end
						if waypoint.Action == Enum.PathWaypointAction.Jump then
							humanoid.Jump = true
						end
						navigation.LastPoint = waypoint.Position
						humanoid:MoveTo(waypoint.Position)
						local waypointDeadline = now() + 5
						while
							flatDistance(root.Position, waypoint.Position) > 3
							and not (waypointReached and flatDistance(root.Position, waypoint.Position) <= arrivalTolerance)
						do
							if (root.Position - destination).Magnitude <= radius then
								return true
							end
							if wasCarrying and player:GetAttribute("HalloweenCarrying") ~= true then
								return false, "Carry changed"
							end
							if changedScene() then
								return false, "Transition"
							end
							if not enabled(mode) or not connected() or player.Character ~= character then
								return false, "Cancelled"
							end
							if humanoid.Health <= 0 then
								return false, "Character unavailable"
							end
							if now() - started > 12 then
								return false, (root.Position - initial).Magnitude > 3 and "Moving" or "Navigation stalled"
							end
							if now() > waypointDeadline then
								return false, "Navigation stalled"
							end
							waitFor(0.1)
						end
						waitFor()
					end
					return (root.Position - destination).Magnitude <= radius, "Moving"
				end
				local succeeded, arrived, reason = pcall(followPath)
				state.LastNavigation = {
					Reason = reason,
					Elapsed = now() - started,
					Waypoints = #waypoints,
					DistanceLeft = (root.Position - destination).Magnitude,
				}
				navigation.Cancel()
				if not succeeded then
					error(arrived)
				end
				return arrived, reason
			end
			local function approach(mode, target, radius)
				local arrived, reason = move(mode, target, radius)
				if
					not arrived
					and reason ~= "Moving"
					and reason ~= "Transition"
					and reason ~= "Carry changed"
					and reason ~= "Cancelled"
					and reason ~= "Character unavailable"
				then
					pause(mode, reason)
				end
				return arrived
			end
			local function portalPoint(portal)
				local hitbox = portal and portal:FindFirstChild("Hitbox", true)
				if not hitbox or not hitbox:IsA("BasePart") then
					return nil
				end
				return hitbox.CFrame:PointToWorldSpace(Vector3.new(0, -hitbox.Size.Y / 2 + 3, 0))
			end
			local function enter(mode)
				if inside() then
					local root = avatar()
					local transition = player:GetAttribute("HalloweenTransition")
					local covering = type(transition) == "string" and string.match(transition, "^%d+:cover:%a+$") ~= nil
					if covering or root and math.abs(root.AssemblyLinearVelocity.Y) > 6 then
						status(mode, "Waiting for the Halloween transition")
						return false
					end
					return true
				end
				local save = context.GetSave()
				local eligibility = module("Shared/Util/HalloweenDimensionEligibility")
				if not save or not eligibility or type(eligibility.IsEligible) ~= "function" then
					status(mode, "Waiting for Halloween data")
					return false
				end
				if not eligibility.IsEligible(save.SpeedPower or 0) then
					status(mode, "Train more speed to unlock Halloween")
					return false
				end
				if not save.GuardTutorialProgress or save.GuardTutorialProgress.Completed ~= true then
					status(mode, "Complete the guard tutorial first")
					return false
				end
				if flag("Shared/Flags/HalloweenDimensionFlags", "ContentEnabled", false) ~= true then
					status(mode, "Halloween is currently unavailable")
					return false
				end
				local mainWorld = world:FindFirstChild("World")
				local portal = mainWorld and mainWorld:FindFirstChild("HalloweenDimensionPortal")
				local point = portalPoint(portal)
				if not point then
					status(mode, "Waiting for the Halloween portal")
					return false
				end
				status(mode, "Walking to the Halloween portal")
				if approach(mode, point, 4) then
					if not confirm(mode, inside, 8) then
						pause(mode, "Portal entry was not confirmed")
					end
				end
				return false
			end
			local function safePoint()
				local currentMap = map()
				local zones = currentMap and currentMap:FindFirstChild("Zones")
				local safe = zones and zones:FindFirstChild("SafeZone")
				local root, humanoid = avatar()
				if not safe or not safe:IsA("BasePart") or not root then
					return nil
				end
				local half = safe.Size / 2
				if world.Raycast then
					if state.SafeFloorMap ~= currentMap or not state.SafeFloorPoints then
						local points = {}
						local ray = RaycastParams.new()
						ray.FilterType = Enum.RaycastFilterType.Include
						ray.FilterDescendantsInstances = { currentMap:FindFirstChild("Ground") or currentMap }
						ray.RespectCanCollide = true
						local clearance = math.max(3, (humanoid.HipHeight or 2) + root.Size.Y / 2)
						for _, x in ipairs({ -0.75, -0.5, -0.25, 0, 0.25, 0.5, 0.75 }) do
							for _, z in ipairs({ -0.85, 0, 0.85 }) do
								local origin = safe.CFrame:PointToWorldSpace(Vector3.new(x * half.X, half.Y + 8, z * half.Z))
								local hit = world:Raycast(origin, Vector3.new(0, -safe.Size.Y - 32, 0), ray)
								if hit then
									table.insert(points, hit.Position + Vector3.new(0, clearance, 0))
								end
							end
							waitFor()
						end
						if #points == 0 then
							return nil
						end
						state.SafeFloorMap, state.SafeFloorPoints = currentMap, points
					end
					local best, distance
					for _, point in ipairs(state.SafeFloorPoints) do
						local candidate = flatDistance(root.Position, point)
						if not distance or candidate < distance then
							best, distance = point, candidate
						end
					end
					return best
				end
				local localPoint = safe.CFrame:PointToObjectSpace(root.Position)
				return safe.CFrame:PointToWorldSpace(
					Vector3.new(
						math.clamp(localPoint.X, -half.X + 12, half.X - 12),
						-half.Y + 3,
						math.clamp(localPoint.Z, -half.Z + 12, half.Z - 12)
					)
				)
			end
			local function prepareEscape(mode)
				local root, _, character = avatar()
				local destination = safePoint()
				if not root or not destination then
					pause(mode, "Escape route is unavailable")
					return false
				end
				local pathfinding = context.Pathfinding or game:GetService("PathfindingService")
				local path =
					pathfinding:CreatePath({ AgentRadius = 2, AgentHeight = 5, AgentCanJump = true, WaypointSpacing = 12 })
				local ok = pcall(path.ComputeAsync, path, root.Position, destination)
				local points = ok and path.Status == Enum.PathStatus.Success and path:GetWaypoints() or nil
				if path.Destroy then
					path:Destroy()
				end
				if points and (#points == 0 or flatDistance(points[#points].Position, destination) > 8) then
					points = nil
				end
				if not points or #points > 256 then
					pause(mode, "No bounded escape route to the safe zone")
					return false
				end
				state.EscapeRoute = {
					Character = character,
					Start = root.Position,
					Destination = destination,
					Waypoints = points,
					Expires = now() + 10,
				}
				return true
			end
			local function inSafeZone()
				local root = avatar()
				local zones = map() and map():FindFirstChild("Zones")
				local safe = zones and zones:FindFirstChild("SafeZone")
				if not root or not safe then
					return false
				end
				local point = safe.CFrame:PointToObjectSpace(root.Position)
				local half = safe.Size / 2
				return math.abs(point.X) <= math.max(half.X - 4, 0)
					and math.abs(point.Y) <= half.Y
					and math.abs(point.Z) <= math.max(half.Z - 4, 0)
			end
			local function recoverEgg(mode)
				if player:GetAttribute("HalloweenCarrying") ~= true then
					return false
				end
				local point = safePoint()
				if not point then
					return pause(mode, "Safe zone is unavailable")
				end
				local delivered = player:GetAttribute("HalloweenDelivered")
				status(mode, "Returning the Halloween egg to the safe zone")
				local arrived = approach(mode, point, 5)
				if state.HaltedReason then
					return true
				end
				if arrived or player:GetAttribute("HalloweenCarrying") ~= true then
					if confirm(mode, function()
						return player:GetAttribute("HalloweenCarrying") ~= true
					end, 8) then
						if player:GetAttribute("HalloweenDelivered") ~= delivered then
							state.CompletedTrips += 1
							state.StartedFromSafe = true
						else
							state.LostEggs = (state.LostEggs or 0) + 1
							state.StartedFromSafe = false
							state.NextPickup = now() + 3
							if context.BalanceFarm then state.NextFarmVisit = now() + 60 end
							status(mode, "Egg lost; returning to the safe zone before another attempt")
						end
					else
						pause(mode, "Egg delivery was not confirmed")
					end
				end
				return true
			end
			local function farm()
				local mode = "Farm"
				if not enabled(mode) then
					return false
				end
				if not enter(mode) then
					return inside() or state.Task == "Walking to the Halloween portal"
				end
				if recoverEgg(mode) then
					return true
				end
				if not state.StartedFromSafe then
					if inSafeZone() then
						state.StartedFromSafe = true
					else
						local point = safePoint()
						if not point then
							return pause(mode, "Safe zone is unavailable")
						end
						status(mode, "Returning to the safe zone before the next egg")
						approach(mode, point, 5)
						return true
					end
				end
				if now() < (state.NextPickup or 0) then
					status(mode, "Recovering before the next egg")
					return true
				end
				local save = context.GetSave()
				local eggShop = (save.HalloweenTokens or 0) >= 2250 and module("Data/HalloweenDimensionEgg") or nil
				if
					eggShop
					and type(eggShop.Price) == "number"
					and (save.HalloweenTokens or 0) >= eggShop.Price
					and now() - state.LastPurchase >= 3
				then
					local shop = map() and map():FindFirstChild("EggShop")
					local plinth = shop and shop:FindFirstChild("Plinth")
					if not plinth then
						return pause(mode, "Halloween egg shop is unavailable")
					end
					status(mode, "Walking to the Halloween egg shop")
					if not approach(mode, plinth, 8) then
						return true
					end
					status(mode, "Buying a Halloween Dimension Egg")
					local previous = save.HalloweenTokens or 0
					local previousEggs = {}
					for uid in pairs(save.EggInventory or {}) do
						previousEggs[uid] = true
					end
					state.LastPurchase = now()
					local ok, accepted, reason = invoke(mode, remote("HalloweenDimension", "AskBuyEgg"))
					if not ok or accepted ~= true then
						return pause(mode, reason or accepted or "Egg purchase failed")
					end
					if
						not confirm(mode, function()
							return (context.GetSave().HalloweenTokens or previous) < previous
						end)
					then
						return pause(mode, "Egg purchase was not replicated")
					end
					state.PurchasedEggs += 1
					if context.OnEggAcquired then
						confirm(mode, function()
							local acquired = false
							for uid in pairs(context.GetSave().EggInventory or {}) do
								if not previousEggs[uid] then
									context.OnEggAcquired(uid)
									acquired = true
								end
							end
							return acquired
						end)
					end
					return true
				end
				local root = avatar()
				if not root then
					return true
				end
				local folder = map():FindFirstChild("WorldEggs")
				if not folder then
					status(mode, "Waiting for Halloween eggs")
					return true
				end
				local best, bestDistance
				local maxZone = 0
				for zone = 1, 3 do
					local required =
						flag("Shared/Flags/HalloweenDimensionFlags", "GhostRecommendedSpeedZone" .. zone, math.huge)
					if (save.SpeedPower or 0) >= required then
						maxZone = zone
					end
				end
				if maxZone >= 3 then
					local manor = module("Shared/Util/ManorInterior")
					if not manor or not manor.GateOpen() then
						maxZone = 2
					end
				end
				for index, egg in ipairs(folder:GetChildren()) do
					if index % 16 == 0 then
						waitFor()
					end
					local zone = egg:GetAttribute("Zone")
					if
						egg:IsA("Model")
						and type(zone) == "number"
						and zone <= maxZone
						and egg:GetAttribute("HalloweenEggCanPickUp") == true
					then
						local uid = egg:GetAttribute("HalloweenEggUid")
						local distance = (egg:GetPivot().Position - root.Position).Magnitude
						if type(uid) == "string" and (not bestDistance or distance < bestDistance) then
							best, bestDistance = egg, distance
						end
					end
				end
				if not best then
					status(mode, "Waiting for an egg in a suitable zone")
					return true
				end
				state.Zone = best:GetAttribute("Zone")
				status(mode, "Walking to a Halloween egg in zone " .. state.Zone)
				if not approach(mode, best, 7) then
					return true
				end
				if not best.Parent or best:GetAttribute("HalloweenEggCanPickUp") ~= true then
					return true
				end
				if context.ImmediateReturn and not prepareEscape(mode) then
					return true
				end
				local ok, accepted, reason =
					invoke(mode, remote("HalloweenDimension", "AskCarryEgg"), best:GetAttribute("HalloweenEggUid"))
				if not ok or accepted ~= true then
					return pause(mode, reason or accepted or "Egg pickup rejected")
				end
				if not confirm(mode, function()
					return player:GetAttribute("HalloweenCarrying") == true
				end) then
					return pause(mode, "Egg pickup was not replicated")
				end
				if context.ImmediateReturn then
					return recoverEgg(mode)
				end
				return true
			end
		
			local function clearQuestTracking()
				local owned = state.OwnGhostCast or state.MineConnection ~= nil or state.MineScene ~= nil
				if state.MineConnection then
					state.MineConnection:Disconnect()
					state.MineConnection = nil
				end
				state.MineScene = nil
				state.Mines = nil
				local _, humanoid = avatar()
				if owned and humanoid then
					humanoid:Move(Vector3.zero, false)
				end
			end
			local function steerQuest(data)
				local root, humanoid = avatar()
				local slot = player:GetAttribute("GhostDogChase")
				if not root or type(slot) ~= "number" then
					return
				end
				local scene = world:FindFirstChild("GhostDogChaseScene")
				if scene ~= state.MineScene then
					clearQuestTracking()
					state.MineScene = scene
					state.Mines = {}
					if scene then
						local function add(child)
							if child:IsA("Model") and string.find(string.lower(child.Name), "mine", 1, true) then
								state.Mines[child] = true
							end
						end
						state.MineConnection = scene.ChildAdded:Connect(add)
						for index, child in ipairs(scene:GetChildren()) do
							add(child)
							if index % 16 == 0 then
								waitFor()
							end
						end
					end
				end
				local chase = data.Chase
				local radial = root.Position - chase.Center
				local angle = math.atan2(radial.Z, radial.X)
				local distance = ((angle - chase.StartAngle) % (math.pi * 2)) * chase.Radius
				local frame = data.ChaseFrame(slot, distance)
				local current = frame:PointToObjectSpace(root.Position).X
				local best, bestScore = 0, math.huge
				for _, candidate in ipairs({ -11, 0, 11 }) do
					local score = math.abs(candidate - current) * 0.2
					for mine in pairs(state.Mines or {}) do
						if not mine.Parent then
							state.Mines[mine] = nil
						else
							local point = frame:PointToObjectSpace(mine:GetPivot().Position)
							local ahead = -point.Z
							if ahead > -5 and ahead < 75 then
								score += math.max(0, 8 - math.abs(candidate - point.X)) * (2 - math.clamp(ahead / 75, 0, 1)) * 20
							end
						end
					end
					if score < bestScore then
						best, bestScore = candidate, score
					end
				end
				humanoid:Move(frame.RightVector * math.clamp((best - current) * 0.3, -1, 1), false)
			end
			local function runGhostCast(mode, data)
				local native = module("Controllers/Game/GhostDogQuestController")
				if not native or type(native.PrepareCast) ~= "function" or type(native.Hooked) ~= "function" then
					return pause(mode, "Ghost Dog controller is unavailable in this version")
				end
				local ready, result = pcall(native.PrepareCast)
				if not ready or result ~= true then
					status(mode, "Waiting for the fishing sequence")
					return true
				end
				local completed = false
				local outcome
				state.OwnGhostCast = true
				task.defer(function()
					if not enabled(mode) or not connected() then
						outcome = table.pack(true, false)
						completed = true
						return
					end
					outcome = table.pack(pcall(native.Hooked))
					completed = true
				end)
				local deadline = now() + 240
				while not completed and enabled(mode) and connected() and now() < deadline do
					status(mode, "Completing the Ghost Dog fishing sequence")
					steerQuest(data)
					waitFor(0.1)
				end
				clearQuestTracking()
				state.OwnGhostCast = false
				if not completed then
					local abort = remote("GhostDogQuest", "Abort")
					if abort and connected() then
						task.defer(function()
							pcall(abort.InvokeServer, abort)
						end)
					end
					if enabled(mode) then
						return pause(mode, "Ghost Dog sequence did not finish within its time limit")
					end
					return true
				end
				if not outcome[1] then
					return pause(mode, outcome[2])
				end
				if
					not confirm(mode, function()
						local save = context.GetSave()
						return save and save.GhostDogQuest and save.GhostDogQuest.Stage >= data.Stage.Done
					end, 8)
				then
					return pause(mode, "Ghost Dog completion was not confirmed")
				end
				status(mode, "Ghost Dog quest complete; Train Pass unlocked")
				return true
			end
			local function ghostQuest()
				local mode = "Ghost Dog"
				if not enabled(mode) then
					return false
				end
				local save = context.GetSave()
				local quest = save and save.GhostDogQuest
				local data = module("Data/GhostDogQuest")
				if not quest or not data then
					status(mode, "Waiting for Ghost Dog data")
					return false
				end
				if quest.Stage >= data.Stage.Done then
					return false
				end
				if flag("Shared/Flags/GhostDogQuestFlags", "Enabled", false) ~= true then
					return false
				end
				if not enter(mode) then
					return inside() or state.Task == "Walking to the Halloween portal"
				end
				if recoverEgg(mode) then
					return true
				end
				local currentMap = map()
				local folder = currentMap and currentMap:FindFirstChild(data.FolderName)
				local markers = folder and folder:FindFirstChild(data.MarkersName)
				if not markers then
					status(mode, "Waiting for Ghost Dog map markers")
					return true
				end
				if quest.Stage == data.Stage.HasRod then
					status(mode, "Walking to the Ghost Dog fishing spot")
					local spot = markers:FindFirstChild("CastSpot")
					if not spot then
						return pause(mode, "Ghost Dog CastSpot is missing")
					end
					if approach(mode, spot, data.CastDistance - 2) then
						return runGhostCast(mode, data)
					end
					return true
				end
				if quest.Stage == data.Stage.Collecting then
					local root = avatar()
					if not root then
						return true
					end
					local target, targetMarker, nearest
					for _, artifact in ipairs(data.Artifacts) do
						local marker = markers:FindFirstChild(artifact.Marker)
						if not (quest.Artifacts and quest.Artifacts[artifact.Id]) and marker then
							local distance = (position(marker) - root.Position).Magnitude
							if not nearest or distance < nearest then
								target, targetMarker, nearest = artifact, marker, distance
							end
						end
					end
					if target then
						status(mode, "Collecting " .. target.DisplayName)
						if not approach(mode, targetMarker, data.PickupDistance - 2) then
							return true
						end
						local ok, accepted, reason = invoke(mode, remote("GhostDogQuest", "Collect"), target.Id)
						if not ok or accepted ~= true then
							return pause(mode, reason or accepted or "Artifact collection rejected")
						end
						if
							not confirm(mode, function()
								local snapshot = context.GetSave()
								local current = snapshot and snapshot.GhostDogQuest
								return current and current.Artifacts and current.Artifacts[target.Id] == true
							end)
						then
							return pause(mode, "Artifact collection was not replicated")
						end
						return true
					end
					for _, artifact in ipairs(data.Artifacts) do
						if not (quest.Artifacts and quest.Artifacts[artifact.Id]) then
							return pause(mode, "An unfinished artifact has no map marker")
						end
					end
				end
				local npcName = quest.Stage == data.Stage.Reunion and "Fisherman" or "Dog"
				local npcs = module("Controllers/Game/GhostDogQuestController/Npcs")
				local getter = npcs and npcs[npcName]
				local npc = type(getter) == "function" and getter() or nil
				if not npc or not npc.Model then
					status(mode, "Waiting for " .. npcName)
					return true
				end
				status(mode, "Talking to " .. npcName)
				if not approach(mode, npc.Model, data.TalkDistance - 3) then
					return true
				end
				local previous = quest.Stage
				local ok, response, reason = invoke(mode, remote("GhostDogQuest", "Talk"), npcName)
				if not ok or type(response) ~= "string" then
					return pause(mode, reason or response or "Dialogue rejected")
				end
				if
					not confirm(mode, function()
						local snapshot = context.GetSave()
						return snapshot and snapshot.GhostDogQuest and snapshot.GhostDogQuest.Stage > previous
					end, 8)
				then
					return pause(mode, "Quest stage did not advance after dialogue")
				end
				return true
			end
		
			local bossMode = "Boss / The Hollow"
			local function restoreRaceInput()
				local record = state.RaceInput
				state.RaceVector = nil
				if record and record.Controls.GetMoveVector == record.Callback then
					record.Controls.GetMoveVector = record.Original
				end
				state.RaceInput = nil
			end
			local function bindRaceInput()
				if state.RaceInput then
					return true
				end
				local scripts = player:FindFirstChild("PlayerScripts")
				local playerModule = scripts and scripts:FindFirstChild("PlayerModule")
				if not playerModule then
					return false
				end
				local ok, result = pcall(context.Require or require, playerModule)
				if not ok or type(result.GetControls) ~= "function" then
					return false
				end
				local controls = result:GetControls()
				if not controls or type(controls.GetMoveVector) ~= "function" then
					return false
				end
				local original = controls.GetMoveVector
				local function callback(self, ...)
					if state.Active and state.RaceVector and player:GetAttribute("RaceId") ~= nil then
						return state.RaceVector
					end
					return original(self, ...)
				end
				state.RaceInput = { Controls = controls, Original = original, Callback = callback }
				controls.GetMoveVector = callback
				return true
			end
			local function race()
				local raceId = player:GetAttribute("RaceId")
				if raceId == nil then
					restoreRaceInput()
					return false
				end
				if not enabled(bossMode) then
					return true
				end
				local collection = context.Collection or game:GetService("CollectionService")
				local track
				for _, candidate in ipairs(collection:GetTagged("RaceTrack")) do
					if candidate.Name == raceId then
						track = candidate
						break
					end
				end
				local pathModule = module("Shared/Modules/RaceTrackPath")
				local attachments = track and track:FindFirstChild("AttachmentTrack")
				if not attachments or not pathModule then
					status(bossMode, "Waiting for The Hollow track")
					return true
				end
				local path = pathModule.new(attachments)
				if not bindRaceInput() then
					return pause(bossMode, "Race controls are unavailable")
				end
				local distance = 0
				local deadline = now() + 300
				local lastPosition, lastProgress = nil, now()
				while enabled(bossMode) and connected() and player:GetAttribute("RaceId") == raceId and now() < deadline do
					local root = avatar()
					if not root then
						break
					end
					if player:GetAttribute("RaceFinishPlace") ~= nil then
						state.RaceVector = Vector3.zero
						status(bossMode, "The Hollow finished; waiting for the result")
					else
						local speed = root.AssemblyLinearVelocity.Magnitude
						local projected, offTrack = path:Project(root.Position, distance, 300, math.max(speed * 3, 300))
						if offTrack > 120 then
							projected = path:Project(root.Position, 0, 0, path.Length)
						end
						distance = projected
						local target = path:FrameAt(distance + math.clamp(speed * 0.65 + 25, 35, 100)).Position
						local localTarget = root.CFrame:PointToObjectSpace(target)
						local angle = math.atan2(localTarget.X, -localTarget.Z)
						state.RaceVector =
							Vector3.new(math.clamp(angle * 1.4, -1, 1), 0, math.abs(angle) > 1.15 and -0.35 or -1)
						local grid = player:GetAttribute("RaceGridFrame")
						if lastPosition and (root.Position - lastPosition).Magnitude > 2 then
							lastProgress = now()
						end
						if not lastPosition or (root.Position - lastPosition).Magnitude > 2 then
							lastPosition = root.Position
						end
						if now() - lastProgress > 45 and typeof(grid) ~= "CFrame" then
							restoreRaceInput()
							return pause(bossMode, "The Hollow racer stopped progressing")
						end
						status(
							bossMode,
							"The Hollow / lap "
								.. tostring(player:GetAttribute("RaceLap") or 0)
								.. " / place "
								.. tostring(player:GetAttribute("RacePlace") or "-")
						)
					end
					waitFor(0.1)
				end
				restoreRaceInput()
				if enabled(bossMode) and player:GetAttribute("RaceId") == raceId and now() >= deadline then
					return pause(bossMode, "The Hollow race exceeded its time limit")
				end
				return true
			end
			local function leaveDimension(mode)
				if not inside() then
					return true
				end
				if recoverEgg(mode) then
					return false
				end
				local currentMap = map()
				local portal = currentMap and currentMap:FindFirstChild("ExitPortal", true)
				local point = portalPoint(portal)
				if not point then
					status(mode, "Waiting for the Halloween exit portal")
					return false
				end
				status(mode, "Walking out of the Halloween dimension")
				if approach(mode, point, 4) then
					if not confirm(mode, function()
						return not inside()
					end, 8) then
						pause(mode, "Halloween exit was not confirmed")
					end
				end
				return not inside()
			end
			local function hollowAvailable()
				if not enabled(bossMode) or flag("Shared/Flags/TheHollowFlags", "ContentEnabled", false) ~= true then
					return false
				end
				local save = context.GetSave()
				local prizes = module("Data/TheHollow")
				if save and save.TheHollow and prizes and type(prizes.OrderedPrizes) == "function" then
					local ordered = prizes.OrderedPrizes()
					local last = ordered[#ordered]
					if last and save.TheHollow.Wins >= last.Config.Wins then
						return false
					end
				end
				local endsAt = world:GetAttribute("TheHollowJoinEndsAt")
				return type(endsAt) == "number" and endsAt > world:GetServerTimeNow() + 5 and now() - state.LastJoin > 15
			end
			local function joinHollow()
				if not hollowAvailable() then
					return false
				end
				if inside() then
					leaveDimension(bossMode)
					return true
				end
				status(bossMode, "Joining The Hollow")
				state.LastJoin = now()
				local ok, accepted, reason = invoke(bossMode, remote("TheHollow", "AskEnter"))
				if not ok or accepted ~= true then
					return pause(bossMode, reason or accepted or "The Hollow entry rejected")
				end
				if not confirm(bossMode, function()
					return player:GetAttribute("RaceId") ~= nil
				end, 12) then
					return pause(bossMode, "The Hollow entry was not replicated")
				end
				return race()
			end
			local function bossAvailable()
				if not enabled(bossMode) or flag("Shared/Flags/PumpkinBossFlags", "ContentEnabled", false) ~= true then
					return false
				end
				local manor = module("Shared/Util/ManorInterior")
				local schedule = module("Shared/Util/PumpkinBossSchedule")
				return manor
					and type(manor.GateOpen) == "function"
					and manor.GateOpen()
					and schedule
					and type(schedule.IsOpen) == "function"
					and schedule.IsOpen(world:GetServerTimeNow()) == true
			end
			local function claimMastery(mode)
				if not inside() then
					return false
				end
				local save = context.GetSave()
				local mastery = save and save.HalloweenDimension and save.HalloweenDimension.BossMastery
				if not mastery or (mastery.Mastery or 0) < 1 then
					return false
				end
				local data = module("Data/HalloweenBossMastery")
				if not mastery or not data or type(data.Milestones) ~= "table" then
					return false
				end
				for index, milestone in ipairs(data.Milestones) do
					if index % 16 == 0 then
						waitFor()
					end
					if mastery.Mastery >= milestone.Kills and not mastery.ClaimedMilestoneIds[milestone.Id] then
						status(mode, "Claiming Pumpkin King mastery " .. milestone.Id)
						local ok, accepted, reason = invoke(mode, remote("HalloweenDimension", "AskClaimMastery"), milestone.Id)
						if not ok or accepted ~= true then
							return pause(mode, reason or accepted or "Mastery claim rejected")
						end
						if
							not confirm(mode, function()
								local current = context.GetSave()
								local value = current and current.HalloweenDimension and current.HalloweenDimension.BossMastery
								return value and value.ClaimedMilestoneIds[milestone.Id] == true
							end)
						then
							return pause(mode, "Mastery claim was not replicated")
						end
						return true
					end
				end
				return false
			end
			local function equippedBat()
				local _, humanoid, character = avatar()
				if not character then
					return nil
				end
				local backpack = player:FindFirstChild("Backpack")
				local best
				for _, parent in ipairs({ character, backpack }) do
					if parent then
						for _, tool in ipairs(parent:GetChildren()) do
							if tool:IsA("Tool") and tool:GetAttribute("IsBat") == true then
								best = tool
								if parent == character then
									return tool
								end
							end
						end
					end
				end
				if best then
					humanoid:EquipTool(best)
				end
				return best
			end
			local function nearestDamageTarget(arena, root)
				local collection = context.Collection or game:GetService("CollectionService")
				local best, bestPoint, nearest
				for index, part in ipairs(collection:GetTagged("BatDamagable")) do
					if index % 16 == 0 then
						waitFor()
					end
					if part:IsA("BasePart") and part:IsDescendantOf(arena) then
						local health = part:GetAttribute("Health")
						if type(health) ~= "number" or health > 0 then
							local point = part.CFrame:PointToObjectSpace(root.Position)
							local half = part.Size / 2
							point = part.CFrame:PointToWorldSpace(
								Vector3.new(
									math.clamp(point.X, -half.X, half.X),
									math.clamp(point.Y, -half.Y, half.Y),
									math.clamp(point.Z, -half.Z, half.Z)
								)
							)
							local distance = (point - root.Position).Magnitude
							if not nearest or distance < nearest then
								best, bestPoint, nearest = part, point, distance
							end
						end
					end
				end
				return best, bestPoint, nearest
			end
			local function cannon(arena, root)
				local folder = arena:FindFirstChild("Cannons")
				local best, nearest
				if not folder then
					return nil
				end
				for _, model in ipairs(folder:GetChildren()) do
					local owner = model:GetAttribute("OwnerUserId")
					local zone = model:FindFirstChild("OperatorZone")
					if zone and zone:IsA("BasePart") and (owner == 0 or owner == player.UserId) then
						local distance = (zone.Position - root.Position).Magnitude
						if not nearest or distance < nearest then
							best, nearest = model, distance
						end
					end
				end
				return best
			end
			local function bossFight()
				if player:GetAttribute("InPumpkinArena") ~= true then
					return false
				end
				if not enabled(bossMode) then
					return true
				end
				local arena = world:FindFirstChild("PumpkinArena")
				if not arena then
					status(bossMode, "Waiting for the Pumpkin King arena")
					return true
				end
				if claimMastery(bossMode) then
					return true
				end
				local deadline = now() + 10
				while
					enabled(bossMode)
					and connected()
					and player:GetAttribute("InPumpkinArena") == true
					and now() < deadline
				do
					local root, humanoid = avatar()
					if not root then
						break
					end
					local phase = arena:GetAttribute("Phase")
					state.BossPhase = phase
					status(bossMode, "Pumpkin King / " .. tostring(phase or "loading"))
					if phase == "Defeated" then
						state.DefeatedAt = state.DefeatedAt or now()
						if now() - state.DefeatedAt > 12 then
							local collection = context.Collection or game:GetService("CollectionService")
							for _, exit in ipairs(collection:GetTagged("PumpkinBossExit")) do
								if exit:IsDescendantOf(world) then
									approach(bossMode, exit, 4)
									return true
								end
							end
						end
					elseif phase == "Shield" or phase == "Stunned" then
						local target = cannon(arena, root)
						local zone = target and target:FindFirstChild("OperatorZone")
						if zone then
							local zoneUtil = module("Shared/Util/ShrinePadZone")
							local inZone = zoneUtil and zoneUtil.ContainsPoint(zone, root.Position)
							if not inZone then
								approach(bossMode, Vector3.new(zone.Position.X, root.Position.Y, zone.Position.Z), 2)
							elseif target:GetAttribute("Ready") == true then
								local cooldown = flag("Shared/Flags/PumpkinBossFlags", "CannonFireCooldown", 1)
								if now() - state.LastShot >= cooldown + 0.1 then
									local endpoint = remote("PumpkinBoss", "CannonFire")
									if not endpoint then
										return pause(bossMode, "Cannon remote is missing")
									end
									state.LastShot = now()
									state.NextShotId += 1
									endpoint:FireServer(state.NextShotId)
								end
							end
						end
					elseif phase == "Brute" or phase == "King" then
						state.DefeatedAt = nil
						local target, point, distance = nearestDamageTarget(arena, root)
						local tool = equippedBat()
						if not tool then
							return pause(bossMode, "No bat is available")
						end
						if target then
							local batConfig = module("Shared/Modules/BatController/Config")
							local range = batConfig and tonumber(batConfig.Range) or 7
							if distance > math.max(range - 1, 3) then
								approach(bossMode, Vector3.new(point.X, root.Position.Y, point.Z), math.max(range - 2, 2))
							elseif
								now() - state.LastAttack
								>= flag("Shared/Flags/PumpkinBossFlags", "AttackCooldownSeconds", 1.5) + 0.1
							then
								state.LastAttack = now()
								tool:Activate()
							end
						end
					end
					waitFor(0.2)
				end
				return true
			end
			local function joinBoss()
				if not bossAvailable() then
					return false
				end
				if not enter(bossMode) then
					return inside() or state.Task == "Walking to the Halloween portal"
				end
				if recoverEgg(bossMode) then
					return true
				end
				local currentMap = map()
				local portal = currentMap and currentMap:FindFirstChild("BossPortal")
				local point = portalPoint(portal)
				if not point then
					status(bossMode, "Waiting for the Pumpkin King portal")
					return true
				end
				status(bossMode, "Walking to the Pumpkin King portal")
				if approach(bossMode, point, 4) then
					if
						not confirm(bossMode, function()
							return player:GetAttribute("InPumpkinArena") == true
						end, 10)
					then
						return pause(bossMode, "Pumpkin King entry was not confirmed")
					end
				end
				return true
			end
			local function anyConfigured()
				local current = config()
				return state.Active and (current.Farm == true or current["Ghost Dog"] == true or current[bossMode] == true)
			end
			local function step()
				for _, mode in ipairs({ "Farm", "Ghost Dog", bossMode }) do
					local value = config()[mode] == true
					if not value then
						state.Blocked[mode] = nil
					end
					state.Modes[mode] = value
				end
				if not anyConfigured() then
					restoreRaceInput()
					clearQuestTracking()
					state.HaltedReason = nil
					return false
				end
				if state.HaltedReason then
					status("Paused", state.HaltedReason)
					return true
				end
				if not connected() then
					controller.Stop()
					return true
				end
				if not avatar() then
					status("Idle", "Waiting for the character")
					return true
				end
				local ragdollUntil = player:GetAttribute("RagdollEndTime")
				if type(ragdollUntil) == "number" and ragdollUntil > world:GetServerTimeNow() then
					status("Idle", "Waiting for ragdoll recovery")
					return true
				end
				if player:GetAttribute("RaceId") ~= nil then
					return race()
				end
				if player:GetAttribute("InPumpkinArena") == true then
					return bossFight()
				end
				for _, mode in ipairs({ "Farm", "Ghost Dog", bossMode }) do
					if enabled(mode) and player:GetAttribute("HalloweenCarrying") == true then
						return recoverEgg(mode)
					end
				end
				if hollowAvailable() then
					return joinHollow()
				end
				if bossAvailable() then
					return joinBoss()
				end
				if enabled("Ghost Dog") and ghostQuest() then
					return true
				end
				if enabled("Farm") then
					if context.BalanceFarm then
						if now() < state.NextFarmVisit then
							if inside() then
								leaveDimension("Farm")
								return true
							end
							return false
						end
						if not state.FarmVisitStarted then
							state.FarmVisitStarted = now()
							state.FarmVisitTrips = state.CompletedTrips
						end
						if now() - state.FarmVisitStarted >= 90 or state.CompletedTrips - state.FarmVisitTrips >= 2 then
							if inside() and not leaveDimension("Farm") then
								return true
							end
							state.FarmVisitStarted = nil
							state.NextFarmVisit = now() + 60
							return false
						end
					end
					if inside() and claimMastery("Farm") then
						return true
					end
					return farm()
				end
				if enabled(bossMode) and inside() and claimMastery(bossMode) then
					return true
				end
				if inside() then
					for _, mode in ipairs({ "Ghost Dog", bossMode }) do
						if enabled(mode) then
							leaveDimension(mode)
							return true
						end
					end
					status("Paused", "All enabled Halloween modes are paused")
					return true
				end
				for mode, reason in pairs(state.Blocked) do
					status(mode, "Paused: " .. reason)
					return true
				end
				return false
			end
			function controller.Enabled()
				return anyConfigured()
			end
			function controller.Step()
				local ok, result = pcall(step)
				if not ok then
					restoreRaceInput()
					clearQuestTracking()
					local mode = state.Mode
					if mode ~= "Farm" and mode ~= "Ghost Dog" and mode ~= bossMode then
						mode = "Farm"
					end
					return pause(mode, result)
				end
				state.OwnsStep = result == true or state.HaltedReason ~= nil
				return state.OwnsStep
			end
			function controller.Snapshot()
				local save = context.GetSave() or {}
				local quest = save.GhostDogQuest or {}
				local dimension = save.HalloweenDimension or {}
				local mastery = dimension.BossMastery or {}
				local arena = world:FindFirstChild("PumpkinArena")
				local currentMap = map()
				local eggs = currentMap and currentMap:FindFirstChild("WorldEggs")
				local eligibility = module("Shared/Util/HalloweenDimensionEligibility")
				return {
					Build = state.Build,
					Active = state.Active,
					Mode = state.Mode,
					Task = state.Task,
					Blocked = table.clone(state.Blocked),
					HaltedReason = state.HaltedReason,
					ModuleTimes = table.clone(state.ModuleTimes),
					Config = {
						Farm = config().Farm == true,
						["Ghost Dog"] = config()["Ghost Dog"] == true,
						[bossMode] = config()[bossMode] == true,
					},
					Inside = inside(),
					Eligible = eligibility and eligibility.IsEligible(save.SpeedPower or 0) or false,
					RequiredSpeed = eligibility and eligibility.RequiredSpeedPower() or nil,
					Tokens = save.HalloweenTokens or 0,
					SpeedPower = save.SpeedPower or 0,
					QuestStage = quest.Stage or 0,
					Mastery = mastery.Mastery or 0,
					HollowWins = save.TheHollow and save.TheHollow.Wins or 0,
					RaceId = player:GetAttribute("RaceId"),
					BossPhase = arena and arena:GetAttribute("Phase"),
					Carrying = player:GetAttribute("HalloweenCarrying") == true,
					EggCount = eggs and #eggs:GetChildren() or 0,
					CompletedTrips = state.CompletedTrips,
					PurchasedEggs = state.PurchasedEggs,
				}
			end
			function controller.Info(format)
				local save = context.GetSave() or {}
				local quest = save.GhostDogQuest or {}
				local mastery = save.HalloweenDimension and save.HalloweenDimension.BossMastery or {}
				return string.format(
					"Halloween Tokens: %s\nSpeed: %s\nGhost Dog: %s / 4\nPumpkin Mastery: %s\nThe Hollow wins: %s\nEgg trips: %s\nEggs bought: %s",
					format(save.HalloweenTokens or 0),
					format(save.SpeedPower or 0),
					tostring(quest.Stage or 0),
					tostring(mastery.Mastery or 0),
					tostring(save.TheHollow and save.TheHollow.Wins or 0),
					tostring(state.CompletedTrips),
					tostring(state.PurchasedEggs)
				)
			end
			function controller.Stop()
				if state.Navigation then
					state.Navigation.Cancel()
				end
				if not state.Active then
					return
				end
				state.Active = false
				restoreRaceInput()
				clearQuestTracking()
				if state.OwnGhostCast and connected() then
					local abort = remote("GhostDogQuest", "Abort")
					if abort then
						task.defer(function()
							pcall(abort.InvokeServer, abort)
						end)
					end
				end
				state.OwnGhostCast = false
			end
			return controller
		end
		local previous = environment.__SkiderSaeHalloween
		if type(previous) == "table" and previous.Game == game and type(previous.Stop) == "function" then previous.Stop() end
		tbl21.Halloween = createHalloween({
			Game = game,
			Player = tbl17.LocalPlayer,
			World = tbl17.Workspace,
			Storage = tbl17.RS,
			GetSave = tbl18.Save.Peek,
			GetConfig = function()
				local config = environment.Config
				return type(config) == "table" and config.Halloween or stealAnEgg.Halloween
			end,
			SetMode = fn30,
			SetTask = fn29,
			BalanceFarm = true,
			ImmediateReturn = true,
			OnEggAcquired = function(uid) tbl21.FarmPlanner.RegisterEgg(uid) end,
		})
		environment.__SkiderSaeHalloween = tbl21.Halloween
	end
	do
		warn("[StealAnEgg] Starting loop...")
		fn52()
		tbl21.antiAfk = { fireHooked = false, invokeHooked = false, idledConn = nil }

		do
			local function fn66()
				for _, v75 in ipairs(getconnections(tbl17.LocalPlayer.Idled)) do
					v75:Disable()
				end

				if not tbl21.antiAfk.idledConn then
					local VirtualUser = game:GetService("VirtualUser")

					do
						tbl21.antiAfk.idledConn = tbl17.LocalPlayer.Idled:Connect(function()
							pcall(function()
								local random2 = math.random
								VirtualUser:ClickButton2(Vector2.new(math.random(0, 1000), random2(0, 1000)))
							end)
						end)
					end
				end

				pcall(function()
					tbl19.SubmitIdleState:FireServer(false)
				end)

				return true
			end

			fn66()
		end
	end
	do
		local function fn66()
			while true do
				if not game:GetService("NetworkClient"):FindFirstChildOfClass("ClientReplicator") then
					if tbl21.Halloween then tbl21.Halloween.Stop() end
					if tbl21.FarmPlanner then tbl21.FarmPlanner.Stop() end
					break
				end
				local ok, failure = pcall(function()
					if tbl21.FarmPausedReason then
						fn30("Paused")
						fn29(tbl21.FarmPausedReason)
						return
					end
					if tbl21.Halloween and tbl21.Halloween.Enabled() and tbl21.Halloween.Step() then return end
					tbl21.FarmPlanner.Step()
				end)
				if not ok then
					stealAnEgg.ForceStealPosition = nil
					pcall(fn49, false)
					fn30("Recovering")
					fn29("Retrying after an error...")
					warn("[StealAnEgg] Main loop failed:", failure)
				end

				task.wait(tbl20.MainLoopWait)
			end
		end

		fn66()
	end
	return
end)()
