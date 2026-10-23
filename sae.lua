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

						local n31 = os.clock() + 30

						while not (tbl22.bacInstalled and tbl22.perFrameHooked) do
							if os.clock() >= n31 then
								error("Movement hook was not found within 30 seconds")
							end
							fn51()
							task.wait(0.5)
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
								local centerPoint = v78 and v78:FindFirstChild("CenterPoint")
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
							local compact = stealAnEgg["Hide Ui"] == true
							local brand = "SKIDER SAE KAITUN"
							local green = Color3.fromRGB(83, 230, 119)
							local textColor = Color3.fromRGB(211, 240, 218)
							local previous = tbl21.ui.UI
							if previous and previous.Gui then
								previous.Gui:Destroy()
							end
							for _, child in tbl17.LocalPlayer.PlayerGui:GetChildren() do
								if child:IsA("ScreenGui") and (child.Name == brand or child.Name == "Hikko") then
									child:Destroy()
								end
							end

							local function create(className, name, parent, properties)
								local instance = Instance.new(className)
								instance.Name = name
								for key, value in pairs(properties or {}) do
									instance[key] = value
								end
								instance.Parent = parent
								return instance
							end

							local gui = create("ScreenGui", brand, tbl17.LocalPlayer.PlayerGui, {
								ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
								DisplayOrder = 999,
								IgnoreGuiInset = true,
								Enabled = true,
								ResetOnSpawn = false,
							})
							local viewport = create("Frame", "Viewport", gui, {
								BackgroundTransparency = 1,
								BorderSizePixel = 0,
								Size = UDim2.fromScale(1, 1),
							})
							local frame = create("Frame", "Main", viewport, {
								AnchorPoint = compact and Vector2.new(1, 1) or Vector2.new(0.5, 0.5),
								BackgroundColor3 = Color3.fromRGB(10, 14, 11),
								BorderColor3 = green,
								BorderSizePixel = 3,
								Position = compact and UDim2.new(1, -18, 1, -18) or UDim2.fromScale(0.5, 0.5),
								Size = compact and UDim2.fromOffset(360, 370) or UDim2.fromScale(1, 1),
							})
							local fps = create("TextLabel", "FPS", viewport, {
								AnchorPoint = Vector2.new(1, 0),
								BackgroundColor3 = Color3.fromRGB(10, 14, 11),
								BorderColor3 = green,
								BorderSizePixel = 2,
								Position = UDim2.new(1, -18, 0, 18),
								Size = UDim2.fromOffset(124, 30),
								ZIndex = 3,
								Font = Enum.Font.FredokaOne,
								Text = "FPS: ...",
								TextColor3 = green,
								TextSize = 18,
							})
							local frames, elapsed = 0, 0
							local fpsConnection = tbl17.RunService.RenderStepped:Connect(function(deltaTime)
								frames += 1
								elapsed += deltaTime
								if elapsed >= 0.25 then
									fps.Text = ("FPS: %d"):format(math.floor(frames / elapsed + 0.5))
									frames, elapsed = 0, 0
								end
							end)
							fps.Destroying:Once(function()
								fpsConnection:Disconnect()
							end)

							if compact then
								local scale = create("UIScale", "ResponsiveScale", frame)
								local function fit()
									local size = viewport.AbsoluteSize
									scale.Scale =
										math.min(1, math.max(size.X - 36, 1) / 360, math.max(size.Y - 36, 1) / 370)
								end
								local connection = viewport:GetPropertyChangedSignal("AbsoluteSize"):Connect(fit)
								gui.Destroying:Once(function()
									connection:Disconnect()
								end)
								fit()
							end

							local function label(name, text, y, height, largeY, largeHeight, textSize, color)
								local result = create("TextLabel", name, frame, {
									AnchorPoint = compact and Vector2.new(0, 0) or Vector2.new(0.5, 0.5),
									BackgroundTransparency = 1,
									BorderSizePixel = 0,
									Position = compact and UDim2.fromOffset(16, y) or UDim2.fromScale(0.5, largeY),
									Size = compact and UDim2.new(1, -32, 0, height)
										or UDim2.fromScale(0.78, largeHeight),
									ZIndex = 2,
									Font = Enum.Font.FredokaOne,
									Text = text,
									TextColor3 = color or textColor,
									TextScaled = true,
									TextSize = compact and textSize or 100,
									TextWrapped = true,
								})
								if compact then
									create("UITextSizeConstraint", "TextSize", result, {
										MinTextSize = 10,
										MaxTextSize = textSize,
									})
								end
								return result
							end

							label("Title", brand, 12, 36, 0.14, 0.1, 24, green)
							local session = label("SessionTime", "Session Time: Loading", 56, 22, 0.27, 0.116130508, 16)
							local zone = label("Current Zone", tbl21.ui.Mode, 84, 26, 0.376230229, 0.09, 18, green)
							local info = label("Info", "Loading...", 124, 166, 0.56, 0.24, 15)
							info.TextYAlignment = Enum.TextYAlignment.Top
							local lastTask =
								label("LastTask", "Task: " .. tbl21.ui.CurrentTask, 300, 38, 0.79, 0.11, 14)
							lastTask.TextYAlignment = Enum.TextYAlignment.Top
							label("Username", tbl17.LocalPlayer.Name, 342, 18, 0.947248161, 0.05, 13)

							tbl21.ui.UI = {
								Gui = gui,
								Whole = frame,
								Info = info,
								LastTask = lastTask,
								SessionTime = session,
								CurrentZone = zone,
								FPS = fps,
								Compact = compact,
							}
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
								fn50()
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
							local playerScripts = tbl17.LocalPlayer:FindFirstChild("PlayerScripts")

							if playerScripts then
								local tbl22 = {}

								for _, descendant in ipairs(playerScripts:GetDescendants()) do
									if descendant:IsA("LocalScript") and not tbl22[descendant.Name] then
										descendant.Disabled = true
									end
								end
							end

							local terrain = tbl17.Workspace:FindFirstChildOfClass("Terrain")

							pcall(function()
								UserSettings():GetService("UserGameSettings").SavedQualityLevel =
									Enum.SavedQualitySetting.QualityLevel1
								UserSettings():GetService("UserGameSettings").MasterVolume = 0
								local level012 = Enum.QualityLevel.Level01
								settings().Rendering.QualityLevel = level012
								local level04 = Enum.MeshPartDetailLevel.Level04
								settings().Rendering.MeshPartDetailLevel = level04

								if terrain then
									sethiddenproperty(terrain, "Decoration", false)
								end

								sethiddenproperty(tbl17.Lighting, "Technology", 2)
							end)

							for _, child in ipairs(tbl17.Lighting:GetChildren()) do
								child:Destroy()
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
								terrain.WaterWaveSize = 0
								terrain.WaterWaveSpeed = 0
								terrain.WaterReflectance = 0
								terrain.WaterTransparency = 1
							end

							local function fn51(arg)
								if arg.Name == "SKIDER SAE KAITUN" then
									return
								end

								if arg:IsA("Workspace") then
									if arg:FindFirstChildOfClass("Terrain") then
										arg.Terrain.WaterWaveSize = 0
										arg.Terrain.WaterWaveSpeed = 0
										arg.Terrain.Elasticity = 0
										arg.Terrain.WaterReflectance = 0
										arg.Terrain.WaterTransparency = 1
									end

									pcall(function()
										sethiddenproperty(arg, "StreamingTargetRadius", 64)
										sethiddenproperty(arg, "StreamingPauseMode", Enum.StreamingPauseMode.Disabled)

										if arg:FindFirstChildOfClass("Terrain") then
											sethiddenproperty(arg.Terrain, "Decoration", false)
										end
									end)
								elseif arg:IsA("Model") then
									pcall(function()
										do
											sethiddenproperty(arg, "LevelOfDetail", 1)
										end
									end)
								elseif
									arg:IsA("TextButton")
									or arg:IsA("TextLabel") and arg.Name ~= "Title"
									or arg:IsA("ImageLabel")
								then
									arg.Visible = false
								elseif arg:IsA("BasePart") then
									arg.Material = Enum.Material.Plastic
									arg.Reflectance = 0
									arg.Transparency = 1
								elseif arg:IsA("MeshPart") then
									arg.Transparency = 0
									arg.CanCollide = false
								elseif arg:IsA("Texture") or arg:IsA("Decal") then
									arg.Texture = ""
									arg.Transparency = 1
								elseif arg:IsA("SpecialMesh") then
									arg.TextureId = ""
								elseif arg:IsA("ShirtGraphic") then
									arg.Graphic = ""
								elseif arg:IsA("Lighting") then
									arg.GlobalShadows = false
									arg.FogEnd = 0
									arg.Brightness = 0
								elseif arg:IsA("Shirt") or arg:IsA("Pants") then
									arg[arg.ClassName .. "Template"] = ""
								elseif arg:IsA("ParticleEmitter") or arg:IsA("Trail") then
									arg.Enabled = false
								elseif
									arg:IsA("BlurEffect")
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
									or arg:IsA("ScreenGui")
								then
									arg.Enabled = false
								elseif arg:IsA("Highlight") then
									do
										arg.OutlineTransparency = 1
										arg.FillTransparency = 1
									end
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

							local v75 = 0

							for _, descendant in ipairs(tbl17.Workspace:GetDescendants()) do
								fn51(descendant)
								v75 += 1

								if v75 % 1000 == 0 then
									task.wait(0.05)
								end
							end

							for _, child in ipairs(tbl17.Players:GetChildren()) do
								if child ~= tbl17.LocalPlayer then
									fn51(child)
									v75 += 1

									if v75 % 1000 == 0 then
										task.wait(0.01)
									end
								end
							end

							for _, descendant in ipairs(tbl17.RS:GetDescendants()) do
								fn51(descendant)
								v75 += 1

								if v75 % 1000 == 0 then
									task.wait(0.01)
								end
							end

							for _, descendant in ipairs(tbl17.LocalPlayer.PlayerGui:GetDescendants()) do
								fn51(descendant)
								v75 += 1

								if v75 % 1000 == 0 then
									task.wait(0.01)
								end
							end

							for _, child in ipairs(tbl17.LocalPlayer.PlayerGui:GetChildren()) do
								if child.Name ~= "SKIDER SAE KAITUN" and child.ClassName == "ScreenGui" then
									child.Enabled = false
								end
							end

							pcall(function()
								for _, child in ipairs(tbl17.CoreGui:GetChildren()) do
									if child.Name ~= "DevConsoleMaster" and child:IsA("ScreenGui") then
										child.Enabled = false
									end
								end
							end)

							for _, child in ipairs(tbl17.CoreGui:GetChildren()) do
								if child.Name ~= "DevConsoleMaster" then
									child:Destroy()
								end
							end

							tbl17.Lighting.GlobalShadows = false
							tbl17.Lighting.FogEnd = 1000000
							tbl17.Lighting.ShadowSoftness = 0
							tbl17.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
							tbl17.GuiService.TouchControlsEnabled = false
							tbl17.RunService:Set3dRenderingEnabled(false)
							local n31 = 0

							for _, descendant in ipairs(tbl17.LocalPlayer.PlayerGui:GetDescendants()) do
								if descendant:IsA("Frame") then
									descendant.Visible = false
									n31 += 1

									if n31 % 100 == 0 then
										task.wait(0.01)
									end
								end
							end

							if getrendersteppedlist then
								pcall(function()
									for _, v76 in ipairs(getrendersteppedlist()) do
										tbl17.RunService:UnbindFromRenderStep(v76.Name)
									end
								end)
							end

							local n32 = 0

							for _, v76 in
								{
									"Heartbeat",
									"RenderStepped",
									"Stepped",
									"PreSimulation",
									"PostSimulation",
									"PreRender",
								},
								nil,
								nil
							do
								for _, v77 in getconnections(tbl17.RunService[v76]) do
									local function_ = v77.Function

									if function_ then
										local ok, result = pcall(getinfo, function_)
										if
											ok
											and result
											and string.find(
												getinfo(function_).source,
												"=ReplicatedFirst.UGI.ContentCatalog"
											)
										then
											continue
										end
									end

									v77:Disconnect()
									n32 += 1

									if n32 % 200 == 0 then
										task.wait()
									end
								end
							end

							warn("[Optimize] optimization1 complete")
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

							fn36 = function()
								local n31 = 0
								local v75

								while true do
									local v76 = tbl18.Save.Peek()
									assert(v76, "Expected local save data")

									if stealAnEgg.MaxPlotLevel <= v76.BaseUpgradeLevel then
										do
											return n31, ("Done, level: %d"):format(tbl18.Save.Peek().BaseUpgradeLevel)
										end
									else
										local v77
										v77, v75 = fn47()
										if not v77 then
											break
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

						fn37 = function()
							local n31 = 0
							local v75

							while true do
								local v76 = tbl18.Save.Peek()
								assert(v76, "Expected local save data")

								if stealAnEgg.MaxTreadmillLevel <= v76.TreadmillUpgradeLevel then
									return n31, ("Done, level: %d"):format(tbl18.Save.Peek().TreadmillUpgradeLevel)
								else
									if not fn47() then
										return n31, ("Done, level: %d"):format(tbl18.Save.Peek().TreadmillUpgradeLevel)
									end
									local v77
									v77, v75 = fn48()
									if not v77 then
										break
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
								if arg2.MaxKG < (arg.Scale or 0) then
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
							if #stealAnEgg.StealEggs == 0 then
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

						fn46 = function()
							local n31 = 0

							for _, v75 in ipairs(fn41()) do
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
						local v97, v98 = fn59(arg.Uid)
						fn56("equip result", v97, v98)
						return true, arg.Name
					end

					do
						local v84, v85 = fn61(v83)
						return v84, v85
					end
				end

				fn51 = function()
					if #stealAnEgg.StealEggs == 0 then
						return 0, "No StealEggs configured"
					end
					fn30("Steal Mode")
					fn29("Scanning steal targets...")
					fn57("autoStealEggs start")
					local v75 = 0
					local v76

					while true do
						local v77, v78 = fn43()

						if not v77 then
							fn56("cycle blocked steal", v78)
							fn57("cycle blocked")
							return v75, v78
						else
							local v79 = nil

							for _, v80 in ipairs(fn41()) do
								if fn55(v80) and v80.Position then
									v79 = v80
									break
								else
									v79 = nil
								end
							end

							if not v79 then
								if v75 == 0 then
									fn57("autoStealEggs no target")
								end

								return v75, ("Stolen %d eggs"):format(v75)
							end

							local v80
							v80, v76 = fn60(v79)
							if not v80 then
								break
							end
							v75 += 1
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
					fn55 = function(arg)
						if arg.Placement == nil then
							return false
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
					if fn55(v76) then
						table.insert(tbl22, k)
					end
				end

				local n31 = 0

				for _, v76 in ipairs(tbl22) do
					local v77, v78 = tbl18.PlacedEggRenderer.ActivateLocalEgg(v76)

					if v77 then
						n31 += 1
						task.wait(0.1)
						tbl18.PlacedEggRenderer.Refresh()
					else
						warn("[HatchEggs] failed", v76, v78)
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

						if #stealAnEgg.PlaceEggs == 0 then
							return 0, "No eggs configured in PlaceEggs"
						end
						local tbl23 = {}

						for k, v79 in pairs(v75.EggInventory) do
							if not tbl22[k] then
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
			local function fn61(arg)
				local rs = tbl17.RS
				local localPlayer = tbl17.LocalPlayer
				local findFirstChild = localPlayer.FindFirstChild

				for _, v75 in ipairs({
					tbl17.LocalPlayer:FindFirstChild("PlayerScripts"),
					rs,
					findFirstChild(localPlayer, "PlayerGui"),
				}) do
					if v75 then
						local v76 = v75:FindFirstChild(arg, true)

						if v76 and v76:IsA("ModuleScript") then
							local ok, result = pcall(require, v76)
							if ok then
								return result
							end
						end
					end
				end

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

			local function fn67(arg)
				local ok, result = pcall(function()
					return tbl19.AskWearStill:InvokeServer(arg)
				end)

				return ok and result == true, result
			end

			local function fn68()
				pcall(function()
					tbl19.AskDoffTreadmill:InvokeServer()
				end)

				fn64()
			end

			fn63 = function()
				if not tbl20.AutoTreadmill then
					return false, "C.AutoTreadmill disabled"
				end
				fn30("Farm Mode")
				fn29("Farming treadmill until cycle...")
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
				fn65()
				local v80, v81 = fn67(v75)
				fn58("EQUIP_STATIC", v80, v81)
				fn60()
				local n32 = os.clock() + 8

				while tbl21.treadmillActiveName == nil and os.clock() < n32 do
					task.wait(0.1)
				end

				if tbl21.treadmillActiveName == nil then
					fn68()
					return false, "Failed to activate treadmill"
				end
				local flag14

				while true do
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
								fn67(v75)
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

				fn68()
				fn58("cycle wait done, speed", fn61(), "rolled", flag14)
				return true, flag14 and "Cycle rolled" or "Deadline", flag14
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
			fn30("Maintenance")
			fn29("Equip best trail")
			local v75, v76 = fn35()
			warn("[Trail]", v75, v76)
			fn29("Upgrade base")
			local v77, v78 = fn36()
			warn("[BaseUpgrade] Upgraded", v77, "times:", v78)
			fn29("Upgrade treadmill")
			local v79, v80 = fn37()
			warn("[Treadmill] Upgraded", v79, "times:", v80)
			fn29("Sell pets")
			local v81, v82 = fn39()
			warn("[Sell]", v81, v82)
			fn29("Place eggs")
			local v83, v84 = fn55()
			warn("[PlaceEggs]", v83, v84)
			fn29("Hatch eggs")
			local v85, v86 = fn53()
			warn("[HatchEggs]", v85, v86)
			fn29("Claim index rewards")
			local v87, v88 = fn56()
			warn("[Index]", v87, v88)
			fn29("Claim offline money")
			local v89, v90 = fn57()
			warn("[Offline]", v89, v90)
			fn29("Idle")
		end

		do
			local function fn66()
				task.spawn(function()
					while task.wait(1) do
						if tbl21.ui.UI then
							local startingTime = tbl21.ui.StartingTime
							fn28(tbl21.ui.UI.SessionTime, "Session Time: " .. fn32(os.time() - startingTime))
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
							local n31 = #fn41()
							local v79 = fn46()
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
				local flag14 = #stealAnEgg.StealEggs > 0 and fn45()
				local v75, v76 = fn43()

				if flag14 and v75 then
					fn30("Steal Mode")
					fn29("Scanning steal targets...")
					local v77, v78 = fn51()
					warn("[StealEggs]", v77, v78)
					fn65()
				elseif #stealAnEgg.StealEggs > 0 and (not flag14 or not v75) then
					if not v75 then
						fn30("Farm Mode")
						fn29(("Cycle soon: %s"):format(tostring(v76)))
						warn("[StealEggs] skip:", v76)
						warn("[AutoTM] cycle soon — farm until day change")
					else
						fn30("Farm Mode")
						fn29("No matching eggs — farming...")
						warn("[StealEggs] no matching eggs — farm until day change")
					end

					local v77, v78 = fn63()
					warn("[AutoTM]", v77, v78)
					local v79, v80 = fn64()
					warn("[StealEggs][ASAP]", v79, v80)
					fn65()
				elseif tbl20.AutoTreadmill then
					fn30("Farm Mode")
					fn29("No StealEggs config — farming...")
					warn("[AutoTM] no StealEggs config — farming until cycle")
					local v77, v78 = fn63()
					warn("[AutoTM]", v77, v78)
					fn65()
				else
					fn30("Idle")
					fn29("Waiting...")
					fn65()
					task.wait(tbl20.MainLoopWait)
				end

				task.wait(tbl20.MainLoopWait)
			end
		end

		fn66()
	end
	return
end)()
