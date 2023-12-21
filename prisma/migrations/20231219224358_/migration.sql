-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Follow" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "followerId" TEXT NOT NULL,
    "followingId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Follow" ("createdAt", "followerId", "followingId", "id", "updatedAt") SELECT "createdAt", "followerId", "followingId", "id", "updatedAt" FROM "Follow";
DROP TABLE "Follow";
ALTER TABLE "new_Follow" RENAME TO "Follow";
CREATE INDEX "Follow_followerId_idx" ON "Follow"("followerId");
CREATE INDEX "Follow_followingId_idx" ON "Follow"("followingId");
CREATE UNIQUE INDEX "Follow_followerId_followingId_key" ON "Follow"("followerId", "followingId");
CREATE TABLE "new_Stream" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "thumbnailUrl" TEXT,
    "ingressId" TEXT,
    "serverUrl" TEXT,
    "isLive" BOOLEAN NOT NULL DEFAULT false,
    "isChatEnabled" BOOLEAN NOT NULL DEFAULT true,
    "isChatDelayed" BOOLEAN NOT NULL DEFAULT false,
    "isChatFollowersOnly" BOOLEAN NOT NULL DEFAULT false,
    "userId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Stream" ("createdAt", "id", "ingressId", "isChatDelayed", "isChatEnabled", "isChatFollowersOnly", "isLive", "name", "serverUrl", "thumbnailUrl", "updatedAt", "userId") SELECT "createdAt", "id", "ingressId", "isChatDelayed", "isChatEnabled", "isChatFollowersOnly", "isLive", "name", "serverUrl", "thumbnailUrl", "updatedAt", "userId" FROM "Stream";
DROP TABLE "Stream";
ALTER TABLE "new_Stream" RENAME TO "Stream";
CREATE UNIQUE INDEX "Stream_ingressId_key" ON "Stream"("ingressId");
CREATE UNIQUE INDEX "Stream_userId_key" ON "Stream"("userId");
CREATE INDEX "Stream_userId_idx" ON "Stream"("userId");
CREATE INDEX "Stream_ingressId_idx" ON "Stream"("ingressId");
CREATE INDEX "Stream_name_idx" ON "Stream"("name");
CREATE TABLE "new_Block" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "blockerId" TEXT NOT NULL,
    "blockedId" TEXT NOT NULL
);
INSERT INTO "new_Block" ("blockedId", "blockerId", "id") SELECT "blockedId", "blockerId", "id" FROM "Block";
DROP TABLE "Block";
ALTER TABLE "new_Block" RENAME TO "Block";
CREATE INDEX "Block_blockerId_idx" ON "Block"("blockerId");
CREATE INDEX "Block_blockedId_idx" ON "Block"("blockedId");
CREATE UNIQUE INDEX "Block_blockerId_blockedId_key" ON "Block"("blockerId", "blockedId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
